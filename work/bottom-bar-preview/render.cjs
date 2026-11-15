const path = require('node:path');
const fs = require('node:fs');
const { pathToFileURL } = require('node:url');
const { chromium } = require('C:/Users/Administrator/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/playwright');

async function main() {
  const output = path.resolve(__dirname, '../../outputs/bottom-bar-previews');
  const browserRoot = path.join(process.env.LOCALAPPDATA, 'ms-playwright');
  const installed = fs.readdirSync(browserRoot).filter(name => name.startsWith('chromium_headless_shell-'));
  const executablePath = installed.map(name => path.join(browserRoot, name, 'chrome-headless-shell-win64/chrome-headless-shell.exe'))
    .find(candidate => fs.existsSync(candidate));
  if (!executablePath) { throw new Error('No installed Chromium headless shell found'); }
  const browser = await chromium.launch({ headless: true, executablePath });
  try {
    const page = await browser.newPage({ viewport: { width: 1332, height: 1100 }, deviceScaleFactor: 2 });
    const errors = [];
    page.on('pageerror', error => errors.push(error.message));
    await page.goto(pathToFileURL(path.join(output, 'index.html')).href);
    await page.evaluate(() => document.fonts.ready);
    await page.locator('img').first().evaluate(img => img.decode());
    const overview = page.locator('.overview');
    await overview.screenshot({ path: path.join(output, 'three-options.png') });
    await page.locator('.focus-sheet').screenshot({ path: path.join(output, 'bottom-details.png') });
    for (const variant of ['a', 'b', 'c']) {
      await overview.locator(`.variant-${variant}`).screenshot({ path: path.join(output, `option-${variant}.png`) });
    }
    const desktop = await validate(page);
    await page.locator('.overview .play-button').first().click();
    if (await page.locator('.overview .play-button').first().getAttribute('aria-label') !== '播放') {
      throw new Error('Preview play button did not toggle');
    }
    await page.setViewportSize({ width: 360, height: 800 });
    const mobile = await validate(page);
    await page.locator('.overview .variant-a').screenshot({ path: path.join(output, 'mobile-check.png') });
    if (errors.length) { throw new Error(errors.join('\n')); }
    console.log(JSON.stringify({ desktop, mobile, javascriptErrors: errors.length }, null, 2));
  } finally {
    await browser.close();
  }
}

async function validate(page) {
  return page.evaluate(() => {
    if (document.documentElement.scrollWidth > window.innerWidth) {
      throw new Error('Horizontal page overflow');
    }
    for (const img of document.querySelectorAll('img')) {
      if (!img.complete || !img.naturalWidth) { throw new Error('Reference image missing'); }
    }
    const checked = [];
    for (const phone of document.querySelectorAll('.overview .phone')) {
      const mini = phone.querySelector('.mini').getBoundingClientRect();
      const nav = phone.querySelector('.nav').getBoundingClientRect();
      const track = phone.querySelector('.track').getBoundingClientRect();
      const text = phone.querySelector('.text-button').getBoundingClientRect();
      const pause = phone.querySelector('.play-button').getBoundingClientRect();
      if (mini.bottom > nav.top + 1 || track.right > text.left + 1 || text.right > pause.left + 1) {
        throw new Error(`Overlapping controls in ${phone.dataset.variant}`);
      }
      if (track.width < 40) { throw new Error('Track text has insufficient room'); }
      checked.push({ variant: phone.dataset.variant, width: phone.getBoundingClientRect().width, textWidth: track.width });
    }
    return checked;
  });
}

main().catch(error => { console.error(error); process.exitCode = 1; });

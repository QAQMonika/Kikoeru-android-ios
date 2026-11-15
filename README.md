<p align="center">
  <img src="docs/images/banner.jpg" alt="Kikoeru Enhanced Banner" width="100%" />
</p>

<h1 align="center">Kikoeru Android 魔改增强版</h1>

<p align="center">
  基于 <a href="https://github.com/Zinhao/Kikoeru-android">Zinhao/Kikoeru-android</a>（GPL-3.0）二次开发 · 安装包前往 <a href="https://github.com/QAQMonika/Kikoeru-android-ios/releases">Releases 下载</a>
</p>

---

## 主要改动

- **三端合一作品页**：顶部切换 **在线 / 本地 / 网盘**，支持横向滑动，统一大图详情与双行音轨列表。
- **iOS 26 UI + 新版设置页**：12 套深/浅色主题、液态玻璃/毛玻璃切换、左滑返回；底栏 **「更多 → 更多设置」** 采用卡片式分组，可找到账号切换、配色、记住播放位置与 **「仅加载有字幕作品」** 等开关。
- **逐句滚动模糊字幕**：20sp 居中高亮、非当前句渐进模糊、点按跳句、拖动 2.5 秒后自动回位。
- **百度网盘手机直连**：免电脑 / 免 NAS，直连官方接口播放无损音频与外挂字幕，支持本地作品复制上传。

---

## 百度网盘直连配置（必看）

<p align="center">
  <img src="docs/images/baidu-flow.jpg" alt="百度网盘直连三步配置流程" width="92%" />
</p>

> 凭据用本机 AndroidKeyStore 加密保存，不经过任何第三方服务器，安装包也不含预设密钥，需自备个人开放平台密钥。

### 1. 申请密钥
1. 登录 [百度网盘开放平台](https://pan.baidu.com/union/home)，新建个人/软件类应用（不用填 OAuth 回调地址）。
2. 复制 **`AppKey`** 和 **`SecretKey`**（**不要填成数字 `AppID`**）。
3. 个人应用默认常仅限访问 **`/apps/你的应用名/`**，没有全盘权限时请把作品放到该目录下。

### 2. App 内绑定
1. 首页顶部切到 **「网盘」** → 点 **「配置应用」**（或底栏 **「更多 → 应用配置」**）。
2. 填入 `AppKey` 与 `SecretKey` 保存。
3. 弹窗出现授权码后点 **「打开百度授权」**，网页确认后切回 App 等几秒自动完成绑定。
4. 点 **「选择作品目录」**：
   - 有全盘权限：点 **「浏览文件夹」** 选中目录 → **「使用此目录」**。
   - 仅限应用目录：点 **「直接输入路径」**，填 `/apps/你的应用名`。

### 3. 目录与封面/字幕规则
- 请先**解压**再上传，不支持在线读取 `.zip`/`.rar`。
- 文件夹名尽量带 **`RJ` 编号**（如 `RJ01544069 作品名`），可自动补全标签与缺失封面。
- 封面优先读独立图片（`cover`/`folder`/`封面` 等，最多扫 4 层、48 MB，自动拦截百度违规占位图），其次读音频内嵌封面（WAV/FLAC/MP3/M4A，16 MB），最后按 RJ 号回退官方封面。
- `.lrc` / `.vtt` 字幕与音频放同目录、保持同名主体（同时存在时优先 `.lrc`）。

更多排错与接口细节见 [BAIDU.md](work/subtitle-follow/BAIDU.md)。

---

## 构建与版本

- 当前版本：`fix31`（SHA-256：`DC14F0E02130D38354A9E77F30C6439E46B5C12D4BF0EC8E21CE02C45AC326CA`，1,690 项检查通过）
- 历史改动：[CHANGELOG.md](CHANGELOG.md)
- 开源协议：[LICENSE](LICENSE)（GNU GPL-3.0）

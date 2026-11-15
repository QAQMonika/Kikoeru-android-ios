# APK Patch Workspace

- Deliverables are patched APKs built from `work/reference-apk`.
- Preserve cumulative patches in that directory. The source checkout
  `work/Kikoeru-android` is reference material and contains superseded changes.
- Keep the original player cover/control layout and native subtitle click handlers;
  the player cover uses fitCenter and a 292dp maximum above the 300dp lyric offset.
  Either subtitle effect enabled uses the approved uniform 20sp/current-bold style;
  both effects off restores native 36sp/15sp enlargement and cue icons.
- Whole-row clicks seek; automatic subtitle return only scrolls the list.
  Commit the selected index before refreshing both old and new rows; do not restore
  crossfade animations that can leave two enlarged subtitle holders visible.
- Subtitle effects belong to LrcVisuals under the auto-follow lifecycle, not item
  change animations. Bind typography before measurement; center measured rows with
  continuous viewport scrolling, not post-teleport FLIP. Touch freezes hit targets;
  only dragging clears blur. Reset recycled transforms and respect motion/a11y fallbacks.
- `work/subtitle-follow/src` is authoritative for auto-follow, playback checkpoints,
  preset palettes, and local imports. Regenerate helpers with its build script; do not hand-edit
  generated `smali_classes3` files. The original second dex is nearly full.
- Compile stubs and JVM test doubles must never enter the shipped APK.
- Build using `work/subtitle-follow/build.ps1`; deliver signed APKs in `outputs`.
- Keep old outputs for rollback; use `README.md` for the current deliverable.
- The library shell uses a floating frosted capsule with four destinations and a
  separate search button. Only the current icon and label are `#E93434`; its moving
  dark translucent indicator has no independent stroke, shadow or glass outline.
  Preserve the existing mini-player controls, source-specific favorites, view IDs,
  motion-accessibility fallback and navigation insets.
- Online, local, and cloud are retained content modes in the existing WorksActivity;
  changing modes must not start another Activity, clear a filter or reload a retained
  list. The reusable local/cloud controllers also back their legacy history hosts.
  Keep folder Back and SAF results routed to the active controller. Online popups
  must use a readable bounded width, not the narrow navigation icon as their width.
- Paint exposed decor insets through the window background and set system icons
  through WindowInsetsControllerCompat; preserve existing safe-area padding.
- Playback checkpoints use app-private files, not cache, and the live player index.
  Per-track resume is controlled by PlaybackOptions; disabling must also suppress
  cold-start/history seeks. Select the stored start position before prepare, never
  start at zero then seek. Preserve paused startup and no-autoplay browsing.
  Existing history is viewed works, not a per-track listening log; keep its data/clicks.
- Local listening entries use a separate private file, merged into the existing
  history adapter. Never insert local/synthetic IDs into the online history database.
  Opening a local history entry must not autoplay or send an online work request.
- Local imports default to persisted read-only SAF grants and original content URIs.
  Never copy/move source audio or ship an alternate player. The only permitted source
  deletion is explicit opt-in management with same-tree write reauthorization and a
  fresh checked confirmation. Enforce queue, containment and one-shot guards; tests
  may delete only agent-created disposable fixtures, never existing user works.
  Removing an import deletes only its index. Cancelled/failed scans preserve the index.
- Player Back only finishes and exposes its actual caller; never synthesize a work
  folder/queue return from the current audio. Keep AudioPlayerActivity singleTop,
  not singleTask, so opening from a local page cannot discard that page.
- Queue browsing is an explicit menu action. Opening it or rendering the local mini
  player must not play, seek, or rewrite the queue. Local folder Back goes directly
  to the album overview, not through imported parent folders such as ASMR.
- Local toolbar icons must exist in APK resources. Do not fall back to obsolete
  system navigation/add/menu icons; keep management dialogs on the selected palette.
- Local album previews use two columns and lazy embedded artwork when folder
  pictures are absent. Do not read every audio file during directory indexing.
  Local favorites are independent private metadata, never online marked progress.
  Keep the local 68dp player/56dp navigation and gesture inset in one bar-colored dock.
- WAV artwork fallback must seek over PCM and use the existing ID3 decoder.
  Bound metadata allocations and downsample artwork caches; never rewrite source tags.
- Catalog list/pagination mutations must stay on the main thread and reject stale
  request generations. Never alter remote favorites for tests without authorization,
  change account/host silently, or expose tokens/response bodies in ordinary error UI.
- Fresh catalog creation starts at home/page 1, never from saved tag/filter snapshots.
  Keep live-page resume and explicit filtering separate from audio position recovery.
- Baidu cloud is phone-only: no embedded server, third-party auth relay,
  borrowed app keys or cookie scraping. Real credentials are entered only on the phone,
  encrypted with AndroidKeyStore, never hardcoded/logged or persisted in queue URLs.
  Normal browsing, cloud favorites and new artwork reads stay inside the explicitly
  selected folder; only the user-operated picker may list ancestor directories.
  Upload is explicit, confirmed, copy-only and confined to that selected folder; use
  rtype=0, never overwrite/delete/move source or cloud files, and exclude local deletion
  during a transfer. Do not claim resumability or background survival across process death.
- Cloud playback uses stable account/file IDs and its own Range-aware data source;
  never append the asmr.one token to cloud requests. Non-cloud data sources stay native.
  Keep cover loading off the audio startup path and do not bulk-download audio for art.
- Album callbacks must preserve 64-bit work IDs; cloud cover fallback is bounded to the
  selected root and the current album, never a sibling album or generic collection root.
- Treat JVM/build success separately from real Baidu authorization, Android UI and speed.
  Phone setup and current cloud limits are documented in work/subtitle-follow/BAIDU.md.

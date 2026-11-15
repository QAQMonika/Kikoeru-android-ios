# APK Production Helpers

The shared library shell is implemented by `GlassUi`, `AppShell` and `ShellState`.
`WorksActivity` retains online content plus lazily created `LocalLibraryController`
and `BaiduCloudController` views in one content container; source switching does not
start an Activity or clear a retained mode. Legacy local/cloud Activity wrappers reuse
those same controllers for existing history and explicit intents. Folder Back and SAF
results are routed to the relevant controller. Menus use a bounded readable width.
The glass dock keeps the original mini-player; `FrostDrawable` has a tinted fallback.
`ShellStateTest` checks gesture/menu bounds and packaged verification checks the source,
folder, player and lifecycle bridges. Fix28 passed offline checks and signing but has
not been installed or visually tested on a device. Fix27 remains available for rollback.

`src` is authoritative; `build.ps1` compiles production classes and runs isolated
JVM regression checks before regenerating `work/reference-apk/smali_classes3`.
Only the explicit production class prefixes enter D8. Compile stubs, test doubles,
test JSON dependency, and `tools/DeviceSmoke.java` must never be packaged.

## Subtitle Following

LrcAutoFollow separates browsing/idle return from initial and re-entry alignment.
setupLrc queues alignCurrent instead of starting a SmoothScroller before layout.
The queued task waits for a laid-out, non-computing list, then syncLrcFollowIndex
reads the actual player position, updates the original Lrc model and adapter, and
snaps the measured current row to the viewport center through LrcVisuals; the legacy
route uses scrollToPositionWithOffset when both effects are off. No audio transport operation
is called. Entry alignment also works while playback is paused, without waiting
for the next row event; missing rows wait for layout/data callbacks rather than poll.

onStart/onStop activation retains a pending entry snap but cancels hidden tasks.
Manual browsing uses a 2500ms idle delay after touch release and inertia end; a touch or row click
cancels queued entry alignment. dispose removes both touch/scroll and layout
listeners, so destroyed pages cannot run stale positioning work. A SmoothScroller
that aborts without a scroll-state callback cannot permanently latch returning.
Subtitle parsing and whole-row seek remain intact. Active-row enlargement is the
legacy both-effects-off fallback, not the default modern typography.

LrcSelection normalizes the index and explicitly refreshes the previous and current
rows. LrcAdapter commits oldIndex before either notification; no neighborhood range
can miss a stale enlarged row after a backward seek. The subtitle RecyclerView has
no change animator, avoiding crossfade duplicates. It does not change row XML/styles.

LrcVisuals is owned by LrcAutoFollow, not a RecyclerView change animator. The native
LrcAdapter calls its static bind before measurement without replacing click listeners.
Either effect enabled selects uniform 20sp text, current-only fake bold, 4dp line
spacing, 8dp horizontal/12dp vertical padding and a 48dp minimum row. Shadows and cue
triangles are hidden. Both effects off restores the original 36sp/15sp styling/cues.
Selection changes do not resize the font; the existing unique-selection refresh stays.

Measured viewport padding with clipToPadding=false lets first and last rows center,
while LinearLayoutManager retains surrounding rows. Rows taller than the viewport
align their beginning 12dp below its top. Resize/re-entry centering is unanimated;
paused seeks can recenter, but paused manual browsing does not force a return.

With motion enabled, a 640ms ValueAnimator performs continuous RecyclerView.scrollBy,
not a position teleport followed by a FLIP animation. Directional per-row delays add
at most 22dp residual translations; adjacent full-row bounds are clamped in order.
Fully recycled or distant targets materialize near center before a short entrance.
New requests cancel the previous animator and settle toward the latest target.
Touch-down freezes physical targets without clearing blur; actual dragging releases
transforms and makes browsing clear. Entry snaps are unanimated. Hidden/destroyed
lists release effects, padding, translations, animator and listeners; recycled rows
reset state. Callbacks never seek, play or mutate subtitles/change animations.

Current text stays sharp/opaque. Neighbors ease toward opacity levels down to .16
and density-adjusted blur up to 5dp, with a viewport-edge fade. Twenty-six quantized
RenderEffects are lazily cached on API 31+, isolated in a nested API-specific class;
earlier systems keep opacity only. Unsupported effects fall back. System animation-off
and touch-exploration settings disable motion; touch exploration also keeps text clear.

PlaybackOptions also installs independent persistent subtitle_blur/subtitle_motion
switches (default true) in the existing More page. Returning to the player reloads them.
Both off restores native typography, inactive opacity and the original scrolling route. More's
existing content is wrapped once in a ScrollView; original setting IDs and handlers
are preserved. No new manifest activity or resource layout is required.

## Playback Checkpoints

`PlaybackPosition` is attached to `AudioService` after the binder is initialized.
Its main-thread timer/listener reads ExoPlayer's live index and position. A single
background executor atomically writes `files/playList.json` using the original
`playlist`, `index`, `seek` schema. Writes are throttled to five seconds during
playback and forced on pause, seek, queue replacement, stop, and detach. Identical
snapshots are skipped; failed writes retry. Unprepared queues do not overwrite data.

`LocalFileCache.readLastPlayList` delegates to this executor so reads cannot race
queued writes. First upgrade falls back to the original `cache/playList.json`.
The existing async callback constructs the queue, then the generated restore helper
loads it paused and seeks directly on the player, including a pending seek before
READY. A late startup callback cannot replace a user-selected nonempty queue.

The legacy binder close path still writes its old cache for rollback compatibility,
using the corrected live player index. That cache is not the authoritative new record.
Forced process death cannot run final callbacks: the last checkpoint may be about
five seconds behind (or older if storage writes fail). There is no listening-log DB
and no migration of the existing viewed-work history table.

PlaybackOptions injects a persistent, default-on remember-position switch into
MoreActivity. TrackResume separately stores up to 2000 track bookmarks in private
track_positions preferences. Local identities canonicalize SAF authority/document IDs;
online identities use workId/hash, with host/path fallback excluding URL credentials.
The existing checkpoint timer also updates these records. Native CtrlBinder.play
flushes the outgoing item and passes startPosition into setMediaItems before prepare,
so manually selecting a previous track resumes directly rather than audibly starting
at zero. Completed bookmarks reset to zero; unknown durations retain the stored seek.
Cold-start read seeds only the old current item if absent. Disabling the switch
suppresses per-track reads/writes and both cold-start and local-history seek restores,
but retains existing records for later re-enabling. Queue restore still pauses.

## Personal Baidu Cloud

See [BAIDU.md](BAIDU.md) for phone setup, limits and user verification. Cloud browsing
is a separate non-exported Activity reached from homepage More; it shares the native
mini-player, full player, queue, subtitle follow and checkpoint service. No extra
server process, proxy listener, OpenList dependency or third-party token relay ships.

BaiduApi handles official device authorization/refresh, uinfo, list and filemetas.
BaiduVault authenticates encrypted private no-backup files with AndroidKeyStore AES-GCM;
UI state contains no secrets. Configuration fields disable state save/autofill, request
no keyboard learning and use FLAG_SECURE dialogs. Browser consent remains user-operated.
Cancellation revisions reject old polling; cancellation restores a previous account
without rolling back a refresh token rotated while the new authorization was pending.

Queues persist stable kiko-baidu account/file URIs, not expiring signed URLs. The binder
bypasses its original asmr.one token URL builder for that scheme. BaiduPlayback installs
a routing DataSource in the existing ExoPlayer: non-cloud specs retain DefaultDataSource,
while cloud specs resolve links off-main and stream HTTPS byte ranges. 401/403 opens
retry once with a fresh link; a server ignoring nonzero Range is rejected, not skipped
through a huge download. Credentials/URLs never appear in transport error messages.
Only known Baidu HTTPS domains are accepted for initial links/redirects. Legacy owned
HTTP links are upgraded before use; there is no cleartext download fallback.

Cloud subtitles share LocalPlayback's generation guard and native parser, with same-
folder LRC priority over VTT and a 4 MiB cap. Normal browsing and new cover reads are
confined to the user-selected root; the explicit picker may list its ancestors. Artwork
uses bounded image downloads or seekable capped Range reads for WAV/MP3 ID3 and FLAC
picture blocks; M4A uses the Android MediaMetadataRetriever through the same range cap.
Playback retains the full 64-bit album ID. If the track folder has no cached cover,
scoped lookup can use its own album's parent art and the selected track's embedded art,
without borrowing a sibling or a generic collection root. It then uses existing
LocalArt/Glide paths independently from audio startup. The player retains fitCenter with
a 292dp cap above the 300dp subtitle offset. Folder image caches are capped near 96 MiB.

BaiduUpload plans every file/subfolder in one SAF album, checks its tree again before and
after uploading, requires a one-shot confirmation and uploads only under the selected
cloud root. BaiduUploadHttp has fixed official HTTPS endpoints, no redirects, 4 MiB
multipart chunks and `rtype=0`. It compares block MD5s and verifies returned cloud path
and size, but does not download the finished file for end-to-end verification. Local
deletion and transfer are mutually exclusive. A task lives only in the app process;
cancel/failure can leave remote partials and does not delete any local or cloud file.
Cloud favorites are separate account-scoped private metadata; old online/local history
is unchanged and does not yet include cloud entries. TrackResume uses account/file ID
for cloud bookmarks, independent of folder-derived presentation work IDs or renames.

## Preset Colors

`ThemePalettes` stores one bounded preset index in private `appearance` preferences.
`App.onActivityResumed` applies it only to WorksActivity, WorkTreeActivity and
LastWatchActivity. A root layout observer styles new/recycled visible rows; weak
view caches avoid repeated background changes and do not retain dead activities.
Known card/bar/page roles are used without changing view IDs, types, sizes, click
listeners, category tags, cover images or the player/subtitle screen.

`ThemePaletteActivity` is reached from the fifth item in the homepage More menu.
Native swatches and radio controls select ten presets. It preserves system insets
and scroll position across selections. The default preset restores the approved
dark dock geometry/color. Two light presets use dark text/icons; contrast checks
cover primary and secondary text on all three palette surfaces.

System inset backgrounds are painted on the window itself: LastWatchActivity's
safe-area padding is on the decor, outside its content root. Legacy bar colors
alone cannot cover it on newer edge-to-edge targets. WindowInsetsControllerCompat
sets status/navigation icon appearance; contrast scrims are disabled. Existing
inset padding and dock geometry remain unchanged. The native palette selector
uses the same system-bar helper. Repeated layouts avoid redundant background and
appearance writes.

## Local Library

The sixth homepage More item opens LocalLibraryActivity. Read-only SAF tree grants
are persisted. LocalDocuments queries each folder once, using an iterative
LocalIndex scan on a serialized IO executor. The atomic files/local-library.json
index is replaced only after a complete successful scan. Cancelled/failed scans
preserve the old index. Removing a source never deletes its documents. Limits are
100,000 directories and a 64 MB index; oversized scans fail rather than truncate.

Album cards aggregate imported parents' immediate work folders; a directory with
direct audio remains one album. Nested browsing retains folder boundaries. Search
uses indexed paths. Audio queues use original content URIs, local_import markers,
and negative presentation album IDs; URI identity is authoritative. Local queues
use the existing AudioService, ExoPlayer, player layout and playback checkpoints.
The binder URI hook does not append server tokens to content URIs.

Same-stem LRC/VTT files pair only within their own directory (LRC preferred).
LocalPlayback reads bounded subtitles off-main, guards against late callbacks,
and the binder's setLocalLrc notifies existing listeners. Delayed network subtitle
callbacks are ignored while a local track is current. Native subtitle parsing,
click seek and auto-follow remain shared with online playback. Subtitle typography
follows the same modern/legacy effect switches for either source.

LocalArt loads embedded artwork only for visible rows and the selected track.
Two background workers coalesce requests, weak view keys protect recycled rows,
and only artwork is cached in files/local-covers. Existing folder pictures are
preferred; otherwise directories inherit an audio artwork source without reading
audio during the folder scan. All candidate tracks in the same album are tried
until artwork is found; failures do not persist as a permanent negative cache.
Artwork-only subfolders contribute pictures before audio-less folders are pruned.
Inferred covers at a multi-album root never leak into sibling albums.

LocalWaveArt locates bounded RIFF/WAVE ID3 chunks using a seekable file channel,
skipping PCM bytes; the existing ExoPlayer Id3Decoder handles APIC frames. Tags
are capped at 24 MiB, embedded pictures at 20 MiB. Artwork is decoded with power-
of-two sampling to a longest edge of at most 1600 pixels before atomic caching;
source files are untouched. Corrupt cached images are retried. Non-seekable
providers retain the native metadata path; this fallback targets RIFF WAV, not RF64.
PlayerArtwork intercepts only local album callbacks in the original home/detail
docks and full player. It resolves the restored current track and calls lazy LocalArt
with the audio URI even when local_cover is empty or is the old audio.png placeholder.
Missing cached files retry extraction. Fullscreen images retain fit-center/rounded
transforms and Palette background coloring; recycled remote rows cancel stale local
requests. Normal online cover callbacks keep their original native route.

## Player Navigation And Queue

AudioPlayerActivity.finish now only calls the superclass. Its launch mode is singleTop,
not singleTask; a caller's local page is not removed when an older player exists lower
in the task. PlayerNavigation.openPlayer does not use reorder/clear/new-task flags or
local return extras. Back exposes the real caller, independent of the current audio.
The local cover click closes the player; it no longer navigates to a different folder.
LocalLibraryActivity.onNewIntent is retained for local-history folder intents.
Back within a local directory clears source/parent to the album overview, skipping
collection ancestors. An active search is cleared first; pending deletion guards stay.

MiniPlayer inflates the existing layout_current_play without modifying its geometry.
LocalLibraryActivity and PlaybackQueueActivity connect it to their existing service
binder. Player listeners are active only while visible and removed on destroy; drawing
the dock does not call audio transport. Cover/title/status reflect the live current item.

LocalLibraryActivity adds a 56dp three-icon navigation row below the 68dp mini player:
local works, local favorites, and More. Bottom system insets are padded inside the
bar-colored dock, not the page-colored root. PlaybackQueueActivity similarly paints
its mini player's gesture inset in bar color. Neither dock draws over list contents.
LocalFavorites stores canonical document identities in its own local_favorites
preferences, never the online review table or API. Long-press album cards add/remove
favorites; the favorites tab filters indexed album cards and restricts its search to
those cards. Folder browsing retains the selected tab across configuration recreation.
Removing an import hides unavailable albums without deleting their favorite flags;
reimporting the same documents restores them. Favorite changes never change files,
audio state or online marked progress. Local More links to the existing settings page.

Homepage More and local management explicitly open PlaybackQueueActivity. It displays
a copy of the existing queue and highlights the live index, without online work lookup
or automatic playback. Selecting the current row opens the full player without restart;
selecting a different row uses the original binder.play after validating that queue
identities still match. Queue Back follows its caller. Merely opening/browsing never
changes listening history or the queue. The original player/subtitle XML is unchanged.

## Local Management And Deletion

The local toolbar uses packaged app icons, palette surfaces and 48dp action targets.
Search/import/More remain visible; rescan/source management live in a styled dialog.
Only an active scan replaces import with a cancel action. Dialogs use the selected
palette, 8dp corners, smaller custom titles and styled action buttons. The opt-in
delete switch is false on a fresh activity and is not saved across recreation.

Long-press directory actions offer source deletion only while this switch is on.
LocalDeletion accepts only indexed work directories inside their imported SAF tree,
not a multi-work collection root. Ordinary import remains read-only. Request 73
asks for persisted READ/WRITE on that exact source tree; a wrong tree or missing
WRITE is rejected. Granting permission never starts deletion automatically.
The user must reopen the action and check the irreversible folder-content warning;
the positive button stays disabled until checked. Source removal is index-only.

Preparation scans live documents with canonical authority/document-ID identities,
provider containment checks, delete support and a 100,000-document cap. The immutable
snapshot counts all files, not just audio, and stores structured metadata signatures.
A confirmed one-shot operation rejects any target in the current local playback
queue and fences new playback of its descendants. Execution re-prepares and compares
the snapshot before one DocumentsContract.deleteDocument call on the chosen folder.
It never falls back to raw filesystem deletion. Index pruning happens only after
provider success and handles overlapping imports by canonical document identity.
Provider failure preserves the index; post-delete index-save failure is reported
as partial success requiring a rescan. Providers may partially delete before failure;
there is no recycle bin, undo or guarantee of atomic source-folder deletion.
Deleting a source does not erase its local listening-history record.

## Local History

LocalHistory adds local listening entries to LastWatchActivity's existing adapter
using a copied online list and synthetic negative LocalWorkHistory presentation
records; it never inserts into or mutates the online history database. Async load
and resume refresh merge and sort by timestamp, with native binding/click guards
for local entries. Original online binding and API clicks remain intact.

PlaybackPosition marks actually playing local URIs before its write throttle,
then atomically updates files/local-listening-history.json on its serialized
writer. A pause within five seconds still records; paused startup restores and
directory browsing do not invent listened entries. Local write failures trigger
checkpoint retries. Source-tree URI plus parent-document URI defines identity;
one recent track/position per folder, at most 500 folders and 4 MiB. Corrupt data
is reported in logs and left intact. Records accumulate from this version, with
no reconstruction of earlier unrecorded listening sessions.

Local history clicks open the original local browser without autoplay. A saved
audio URI/seek is passed in activity state; selecting that track resumes once,
using the existing player. Missing imports prompt re-import; no server request
is made for a local history entry. History rows use the existing item_recent_work
layout and palette styling, not a separate history screen.

## Catalog Refresh And Reviews

Fresh WorksActivity creation initializes the home catalog (491), page/currentPage 1,
an empty list and no stale count. onCreate directly calls loadFromNetWork(491), not
loadLastOpenWork. It no longer reads last_type, last_page, saved tag/voice parameters
or the old filtered-list cache. The old exit snapshot remains for rollback but is
not a startup input. This policy applies to recreated catalog activities too;
ordinary onResume/Back preserves the live page. Explicit in-session tag/voice
navigation and account initialization keep their existing paths. Browsing state is
independent of PlaybackPosition/TrackResume; no playback bookmark is deleted or reset.

CatalogState detects subtitle-filter changes on WorksActivity resume and refreshes
the active online list; unchanged home/local-cache views do not re-fetch merely
because they resumed. Review categories re-fetch on ordinary resume. Each request
captures a monotonically increasing generation. Callback delivery, generation
checks, pagination and list mutations run on the main thread, so late responses
cannot contaminate a new filter or category. Original local-cache JSON is retained.

Chinese marked labels now read Want to Listen; the server progress remains marked.
Review requests translate homepage release sorting to updated_at, while other
sort fields/directions remain unchanged. Homepage requests themselves are untouched.
Review errors use an always-visible toast instead of the debug-only native alert;
transport URLs/tokens/bodies are not included in ordinary error UI. Missing success
messages use a fallback, empty successful PUT bodies are accepted, and malformed
bodies reach the callback as failures. Account credentials, host selection and
the existing review PUT endpoint/body contract are not modified.

## Verification Limits

JVM checks execute production helper bytecode with Android/player test doubles and
real JSON parsing. They are logic tests, not Android rendering or real playback.
VerifyHelpers also checks the packaged native-to-helper re-entry calls and ensures
subtitle state synchronization never invokes seek/play/pause. It checks bytecode
integration, including catalog lifecycle/generation/error bridges, not actual
device layout, scroll timing, network synchronization or re-entry gestures.
LocalPlayerFixTest covers all old/new index directions, notification order, no
animator, caller-preserving intents, current-row non-restart and stale queue rejection.
PlayerArtworkTest covers a restored track without cover, placeholder bypass, original
content URI fallback and stale album identity. UI/device validation is separate.
ResumeFavoritesTest adds 47 checks for default/persisted resume behavior, local and
online track identity, corrupt/bounded records, legacy seed, track switching, paused
restore and local favorite isolation/filtering. VerifyHelpers checks the corresponding
native selection/settings bridges and rejects audio/API calls from local tab/favorite
operations. All 815 JVM checks pass for fix19; they do not replace real playback tests.
Fix26 passes 1587 JVM checks, including 121 synthetic BaiduCloudTest, 24 PlayerArtworkTest,
15 BaiduArtTest, 6 BaiduArtMediaTest and 99 BaiduUploadTest checks. The M4A test uses a fake framework
retriever and proves the range adapter, not Android's native parser. Upload tests use
synthetic SAF/HTTPS; they do not establish real Baidu write permission or speed. Packaged
verification checks full-width album IDs, the cover layout, cloud, upload, deletion
exclusion and M4A bridges. The APK is signed/aligned but was not installed or tested on
a real account/device in this run.
LrcVisualsTest now has 522 production-bytecode checks for uniform typography/current
bold, measured first/last/long-row centering, continuous per-frame scroll/non-overlap,
rapid/recycled jumps, touch freezing without a clear flash, readable dragging, paused
seek, preference/system/accessibility fallbacks and full disposal. It checks the
unchanged 2.5-second idle boundary with effects enabled. The original auto-follow
suite exercises both-effects-off fallback; all 1337 JVM checks pass for fix21.
Framework/GPU doubles do not prove real RenderEffect rendering, frame rate or hit tests.
LocalDeletionTest uses a simulated document provider for confirmation/queue fences,
aliases, containment, cycles, changed contents, failure and sibling-preserving prune.
VerifyHelpers also checks toolbar icon resources and palette dialog/toggle bridges.
SystemBarTest additionally checks all presets using window/controller doubles,
including ignored legacy bar colors; this does not replace a device screenshot.
`tools/DeviceSmoke.java` can be compiled separately and run with an APK on an
isolated Android `app_process` classpath: it validates ART linkage, settings class
construction and Android JSON/palette calls without installing the APK or opening
the application. It does not prove the final on-device layout or audio behavior.
It also constructs the native catalog callback, checks stale generations and
verifies review helper links with Android JSON and the original LocalResponse.
With the separately compiled LocalDeletionTest classes on the diagnostic classpath,
its fix17 argument runs the same provider simulation on Android Uri/JSONObject.
This still does not test real persisted permissions or delete a phone source folder.
Separately, the installed fix17 UI build was tested with the disposable
Download/Kikoeru_Codex_fix17_a6e4 tree: unchecked delete disabled, cancel preserved
all files, confirmed SAF deletion removed only Delete_Album, and Keep_Album hashes
matched the original fixtures. The delete toggle was switched off and only that
test import was removed; the original 88 works remained. Screenshots/XML are in
work/local-manage-check. System Back from the existing paused local player returned
directly to RJ01560714 without playback. Missing-WRITE reauthorization and actual
subtitle seek gestures remain outside that device verification.
For fix18, the diagnostic also links the queue/dock/artwork classes and runs the
15-case PlayerArtworkTest on Android JSON (96 linkage checks plus those cases).
The final APK was installed and home/fullscreen local covers and queue UI were seen.
The user took over testing before a controlled Back/local-dock flow completed;
those flows and repeated cold-start reliability remain unverified on-device.
Fix19 was replacement-installed successfully without clearing data. The user elected
to test personally before controlled local-dock, favorite and silent-audio resume UI
tests were completed; phone operations stopped. No fixture was imported, audio started,
favorite changed or source file deleted by this verification. Only classes2.dex and
classes3.dex differ from fix18 outside signature data; original resources are unchanged.
Fix20 was replacement-installed only, per the user's final request. The phone base.apk
hash matches outputs; no UI/audio test or separate preview app was run. Only classes3.dex
differs from fix19 outside signature data. Actual blur, scrolling smoothness and moving
row click targets await the user's device testing; installation is not that validation.
Fix21 replaces that visual implementation after inspecting the user's comparison
videos. Native adapter binding now enters the shared typography helper; packaged
checks confirm this bridge and continuous scrollBy without audio/change-animation
mutation. Only classes2.dex and classes3.dex differ from fix20 outside signature data;
all resources are byte-identical. Replacement install succeeded and the phone base.apk
SHA-256 matches the output. Per final authorization, no page was opened, preview app
installed or audio played. New rendering and moving hit targets remain user-tested,
not verified by JVM doubles or the successful installation. Video frames, analysis
utility and pre-rewrite backups are under work/subtitle-motion-check, not shipped.
Fix22 keeps all 1337 JVM checks and adds packaged startup assertions for home/page-1
defaults, direct home loading, no old-filter snapshot restore and retained in-session
navigation. The same assertions reject the affected fix21 APK. Only classes2.dex
differs from fix21 outside signature data; helper dex and resources are unchanged.
Replacement installation succeeded, and the installed base.apk hash matches outputs.
Per user authorization, no page was opened or audio played. Cold-start navigation
and real resume behavior await user testing, not implied by the installation.
tools/ArtworkProbe.java is a separate read-only device diagnostic for named local
WAV/FLAC folders and the local-history model/helper linkage. It inspects metadata,
not PCM, and uses synthetic in-memory history data. It is never shipped in the APK.

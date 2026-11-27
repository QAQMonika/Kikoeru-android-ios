param([string]$OutputName = 'Kikoeru_fix30_ios_native_debug.apk')

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$buildRoot = Join-Path $PSScriptRoot 'build'
$sdkRoot = Join-Path $projectRoot 'work\android-sdk'
$buildTools = Join-Path $sdkRoot 'build-tools\36.0.0'
$androidJar = Join-Path $sdkRoot 'platforms\android-36\android.jar'
$apktool = Join-Path $projectRoot 'work\apktool.jar'
$gradleCache = Join-Path $env:USERPROFILE '.gradle\caches'

function Check-Exit([string]$step) {
    if ($LASTEXITCODE -ne 0) { throw "$step failed (exit $LASTEXITCODE)" }
}
function Find-ApiJar([string]$pattern) {
    $jar = Get-ChildItem -LiteralPath $gradleCache -Recurse -Filter $pattern |
        Select-Object -First 1
    if (!$jar) { throw "Required cached compile dependency is missing: $pattern" }
    # Keep compiler ZipFS lookups inside the workspace instead of user-cache junctions.
    $apiRoot = Join-Path $buildRoot 'api'
    New-Item -ItemType Directory -Force $apiRoot | Out-Null
    $localJar = Join-Path $apiRoot $jar.Name
    $sourceHash = (Get-FileHash -LiteralPath $jar.FullName -Algorithm SHA256).Hash
    if (!(Test-Path -LiteralPath $localJar) -or (Get-FileHash -LiteralPath $localJar -Algorithm SHA256).Hash -ne $sourceHash) {
        Copy-Item -LiteralPath $jar.FullName -Destination $localJar
    }
    if ((Get-FileHash -LiteralPath $localJar -Algorithm SHA256).Hash -ne $sourceHash) {
        throw "Staged compile dependency checksum mismatch: $($jar.Name)"
    }
    return $localJar
}

Push-Location $projectRoot
try {
    New-Item -ItemType Directory -Force "$buildRoot\classes", "$buildRoot\dex",
        "$buildRoot\tools", "$buildRoot\tests" | Out-Null
    $classPath = $androidJar + ';' + (Find-ApiJar 'recyclerview-*-api.jar') + ';' +
        (Find-ApiJar 'core-1.18.0-api.jar') + ';' +
        (Find-ApiJar '*exoplayer-core-*-api.jar') + ';' +
        (Find-ApiJar '*exoplayer-datasource-*-api.jar') + ';' +
        (Find-ApiJar '*exoplayer-common-*-api.jar') + ';' +
        (Find-ApiJar '*exoplayer-extractor-*-api.jar') + ';' +
        (Find-ApiJar '*androidasync-*-api.jar') + ';' +
        (Find-ApiJar '*glide-*-api.jar') + ';' + (Find-ApiJar 'fragment-*-api.jar') + ';' +
        (Find-ApiJar 'palette-*-api.jar')
    $sources = Get-ChildItem "$PSScriptRoot\src", "$PSScriptRoot\compile-stubs" `
        -Recurse -Filter '*.java' | ForEach-Object FullName
    & javac -encoding UTF-8 --release 8 -cp $classPath -d "$buildRoot\classes" `
        $sources
    Check-Exit 'Helper compilation'
    $testSources = Get-ChildItem "$PSScriptRoot\tests" -Recurse -Filter '*.java' |
        ForEach-Object FullName
    $jsonJar = Join-Path $buildRoot 'json-20240303.jar'
    if (!(Test-Path -LiteralPath $jsonJar)) {
        Invoke-WebRequest 'https://repo.maven.apache.org/maven2/org/json/json/20240303/json-20240303.jar' `
            -OutFile $jsonJar
    }
    if ((Get-FileHash $jsonJar -Algorithm SHA256).Hash -ne `
        '3CF6CD6892E32E2B4C1C39E0F52F5248A2F5B37646FDFBB79A66B46B618414ED') {
        throw 'Test-only JSON dependency checksum mismatch'
    }
    & javac -encoding UTF-8 -cp "$buildRoot\classes;$classPath" -d "$buildRoot\tests" $testSources
    Check-Exit 'Test compilation'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$classPath" com.zinhao.kikoeru.LrcAutoFollowTest
    Check-Exit 'Regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.PositionPaletteTest
    Check-Exit 'Position and palette regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$classPath" com.zinhao.kikoeru.SystemBarTest
    Check-Exit 'System bar regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.LocalIndexTest
    Check-Exit 'Local library regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes" com.zinhao.kikoeru.LocalWaveArtTest
    Check-Exit 'WAV artwork regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.LocalHistoryTest
    Check-Exit 'Local history regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.CatalogStateTest
    Check-Exit 'Catalog refresh and review regression tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.LocalPlayerFixTest
    Check-Exit 'Local navigation and subtitle selection tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.PlayerArtworkTest
    Check-Exit 'Restored playback artwork tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.LocalDeletionTest
    Check-Exit 'Local deletion safety tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.ResumeFavoritesTest
    Check-Exit 'Per-track resume and independent local favorites tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.LrcVisualsTest
    Check-Exit 'Subtitle blur and staggered movement tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.BaiduCloudTest
    Check-Exit 'Baidu cloud authorization, Range and encryption tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes" com.zinhao.kikoeru.BaiduArtTest
    Check-Exit 'Baidu bounded artwork tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes" com.zinhao.kikoeru.BaiduArtMediaTest
    Check-Exit 'Baidu M4A media adapter tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes;$jsonJar;$classPath" com.zinhao.kikoeru.BaiduUploadTest
    Check-Exit 'Baidu copy-only upload tests'
    & java -cp "$buildRoot\tests;$buildRoot\classes" com.zinhao.kikoeru.ShellStateTest
    Check-Exit 'Floating shell navigation tests'
    & javac -cp $apktool -d "$buildRoot\tools" "$PSScriptRoot\tools\Disassemble.java"
    Check-Exit 'Disassembler compilation'
    # Only production helper classes enter D8; no compile stubs or test classes ship.
    $productionClasses = Get-ChildItem "$buildRoot\classes\com\zinhao\kikoeru" -Filter '*.class' |
        Where-Object Name -Match '^(AppShell|GlassUi|ShellState|TitleTranslator|BaiduApi|BaiduHttp|BaiduVault|BaiduCloud|BaiduArt|BaiduArtMedia|BaiduUpload|BaiduUploadHttp|BaiduTransfer|BaiduPlayback|BaiduCloudActivity|BaiduCloudController|LrcAutoFollow|LrcSelection|LrcVisuals|PlaybackPosition|PlaybackOptions|TrackResume|LocalFavorites|ThemePalettes|ThemePaletteActivity|LocalIndex|LocalDocuments|LocalPlayback|LocalLibraryActivity|LocalLibraryController|LocalArt|LocalWaveArt|LocalHistory|LocalDeletion|CatalogState|PlayerNavigation|PlayerArtwork|MiniPlayer|PlaybackQueueActivity)(\$.*)?\.class$' |
        ForEach-Object FullName
    $d8Libraries = @('--lib', $androidJar, '--classpath', "$buildRoot\classes")
    foreach ($dependency in ($classPath.Split(';') | Select-Object -Skip 1)) {
        $d8Libraries += @('--classpath', $dependency)
    }
    $d8Arguments = @('--min-api', '29') + $d8Libraries + @('--output', "$buildRoot\dex") + $productionClasses
    $argumentFile = Join-Path $buildRoot 'd8-arguments.txt'
    [IO.File]::WriteAllLines($argumentFile, @($d8Arguments | ForEach-Object { $_.Replace('\', '/') }), [Text.UTF8Encoding]::new($false))
    & "$buildTools\d8.bat" "@$argumentFile"
    Check-Exit 'D8'
    # The original second dex is almost full. Keep generated helpers in a separate dex.
    foreach ($dexDirectory in @('smali_classes2', 'smali_classes3')) {
        $oldHelperDirectory = Join-Path $projectRoot "work\reference-apk\$dexDirectory\com\zinhao\kikoeru"
        if (Test-Path -LiteralPath $oldHelperDirectory) {
            Get-ChildItem -LiteralPath $oldHelperDirectory -Filter '*.smali' |
                Where-Object Name -Match '^(AppShell|GlassUi|ShellState|TitleTranslator|BaiduApi|BaiduHttp|BaiduVault|BaiduCloud|BaiduArt|BaiduArtMedia|BaiduUpload|BaiduUploadHttp|BaiduTransfer|BaiduPlayback|BaiduCloudActivity|BaiduCloudController|LrcAutoFollow|LrcSelection|LrcVisuals|PlaybackPosition|PlaybackOptions|TrackResume|LocalFavorites|ThemePalettes|ThemePaletteActivity|LocalIndex|LocalDocuments|LocalPlayback|LocalLibraryActivity|LocalLibraryController|LocalArt|LocalWaveArt|LocalHistory|LocalDeletion|CatalogState|PlayerNavigation|PlayerArtwork|MiniPlayer|PlaybackQueueActivity)(\$.*)?\.smali$' |
                ForEach-Object { Remove-Item -LiteralPath $_.FullName }
        }
    }
    & java -cp "$buildRoot\tools;$apktool" Disassemble "$buildRoot\dex\classes.dex" `
        'work\reference-apk\smali_classes3'
    Check-Exit 'Helper disassembly'
    $buildStem = [IO.Path]::GetFileNameWithoutExtension($OutputName)
    $unsignedApk = Join-Path $buildRoot ($buildStem + '_unsigned.apk')
    $alignedApk = Join-Path $buildRoot ($buildStem + '_aligned.apk')
    & java -jar $apktool b 'work\reference-apk' -o $unsignedApk
    Check-Exit 'APK build'
    & "$buildTools\zipalign.exe" -f -p 4 $unsignedApk $alignedApk
    Check-Exit 'APK alignment'
    $outputApk = Join-Path $projectRoot "outputs\$OutputName"
    & "$buildTools\apksigner.bat" sign --ks 'work\debug.keystore' --ks-key-alias androiddebugkey `
        --ks-pass pass:android --key-pass pass:android --out $outputApk `
        $alignedApk
    Check-Exit 'APK signing'
    & "$buildTools\apksigner.bat" verify --verbose $outputApk
    Check-Exit 'Signature verification'
    & "$buildTools\zipalign.exe" -c -p 4 $outputApk
    Check-Exit 'Alignment verification'
    & javac -cp $apktool -d "$buildRoot\tools" "$PSScriptRoot\tools\VerifyHelpers.java"
    Check-Exit 'APK verifier compilation'
    & java -cp "$buildRoot\tools;$apktool" VerifyHelpers $outputApk
    Check-Exit 'Packaged helper verification'
    $playerTree = (& "$buildTools\aapt.exe" dump xmltree $outputApk 'res/layout/activity_player.xml' | Out-String)
    Check-Exit 'Packaged player layout inspection'
    $coverNode = [regex]::Match($playerTree, '(?s)E: ImageView\b.*?(?=\r?\n\s*E:)').Value
    if ($coverNode -notmatch 'android:scaleType\(0x0101011d\)=\(type 0x10\)0x3\b' -or
        $coverNode -notmatch 'android:adjustViewBounds\(0x0101011e\)=\(type 0x12\)0xffffffff\b' -or
        $coverNode -notmatch 'android:maxHeight\(0x01010120\)=\(type 0x5\)0x12401\b' -or
        $playerTree -notmatch 'android:layout_marginTop\(0x010100f8\)=\(type 0x5\)0x12c01\b') {
        throw 'Player cover must fit inside the area above the lyric list'
    }
    Write-Host 'PASS: packaged player cover fits above the subtitle area'
    Get-FileHash -LiteralPath $outputApk -Algorithm SHA256 | Format-List
} finally {
    Pop-Location
}

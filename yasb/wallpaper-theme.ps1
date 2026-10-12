# Watches the Windows wallpaper. When it changes, copies wallpaper-themes\<wallpaper name>.css
# over theme.css so YASB reloads with colors generated from that wallpaper.
# Wallpapers without a matching theme file leave the current theme untouched.
$cfg = "C:\Users\jonat\.config\yasb"

$last = ""
while ($true) {
    $wp = (Get-ItemProperty 'HKCU:\Control Panel\Desktop').WallPaper
    if ($wp -and $wp -ne $last) {
        $last = $wp
        $base  = [IO.Path]::GetFileNameWithoutExtension($wp)
        "$(Get-Date -Format s)  wallpaper: $base" | Add-Content "$cfg\wallpaper-theme.log"
        $theme = "$cfg\wallpaper-themes\$base.css"
        if (Test-Path -LiteralPath $theme) {
            Copy-Item -LiteralPath $theme "$cfg\theme.css" -Force
            (Get-Item "$cfg\styles.css").LastWriteTime = Get-Date   # nudges YASB to reload
        }
    }
    Start-Sleep -Seconds 2
}

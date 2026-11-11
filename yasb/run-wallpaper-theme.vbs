Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell.exe -ExecutionPolicy Bypass -NoProfile -File ""$env:USERPROFILE\.config\yasb\wallpaper-theme.ps1""", 0, False

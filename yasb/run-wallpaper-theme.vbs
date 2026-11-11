Set WshShell = CreateObject("WScript.Shell")

' Dynamically resolve the current user's profile path via VBScript
Dim userProfile, scriptPath
userProfile = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")
scriptPath = userProfile & "\.config\yasb\wallpaper-theme.ps1"

' Execute PowerShell using the fully resolved absolute path
WshShell.Run "powershell.exe -ExecutionPolicy Bypass -NoProfile -File """ & scriptPath & """", 0, False

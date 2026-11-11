# Custom-YASB-Theme-Changer
A minimal, island-style YASB bar for Komorebi that recolors itself automatically whenever you change your wallpaper.
## Dark Mode Example
<img width="2559" height="1599" alt="image" src="https://github.com/user-attachments/assets/43dca0a8-6e11-4124-ab78-d1224bef900b" />

## Light Mode Example
<img width="2559" height="1599" alt="image" src="https://github.com/user-attachments/assets/6936e8eb-477e-435a-b91b-a561ee093be4" />

## Features:
* Adaptive islands bar color style
* Wallpaper based theming

## Requirements
* Windows 11
* YASB(v2.0.7 or newer)
* JetBrainsMono Nerd Font Propo
* Seoge UI Variable

## Installation
1. Install the dependencies
2. Back up your existing ~/config/yasb
3. Copy files to C:\Users\<you>\.config\yasb
4. Customize wallpaper folder location if needed
5. Run shell:startup on Win + R and create a run-wallpaper-theme.vbs shortcut
6. Copy komorebi files and set KOMOREBI_CONFIG_HOME
7. Reload YASB from the tray

## How it works
* theme.css defines color variables (--background, --accent, --text, etc.), and styles.css only uses those variables
* wallpaper-theme.ps1 polls the registry for the current wallpaper, then copies wallpaper-themes/<wallpaper name>.css over theme.css
* It touches styles.css so YASB’s stylesheet watcher reloads
* run-wallpaper-theme.vbs launches it hidden; put a shortcut in shell:startup to run on login
* Naming rule: theme file name must match the wallpaper file name (without extension). Wallpapers with no matching theme leave the current one untouched.

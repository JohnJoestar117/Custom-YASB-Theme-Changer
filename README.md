# Custom-YASB-Theme-Changer

A minimal, island-style [YASB](https://github.com/amnweb/yasb) bar for [Komorebi](https://github.com/LGUG2Z/komorebi) that recolors itself automatically whenever you change your wallpaper.

## Previews

### Dark mode
<img width="2559" height="1599" alt="Dark mode example" src="https://github.com/user-attachments/assets/43dca0a8-6e11-4124-ab78-d1224bef900b" />

### Light mode
<img width="2559" height="1599" alt="Light mode example" src="https://github.com/user-attachments/assets/6936e8eb-477e-435a-b91b-a561ee093be4" />

## Features

- Adaptive "islands" bar style
- Wallpaper-based theming: each wallpaper maps to its own color palette (dark or light)
- Every color lives in one file (`theme.css`), so the stylesheet stays clean
- Komorebi workspaces and layout switcher built into the bar
- Extras: quick launcher, wallpaper gallery, audio visualizer, media controls, control center, systray

## Requirements

- Windows 11
- [YASB](https://github.com/amnweb/yasb) v2.0.7 or newer
- [Komorebi](https://github.com/LGUG2Z/komorebi)
- [JetBrainsMono Nerd Font Propo](https://www.nerdfonts.com/font-downloads)
- Segoe UI Variable (ships with Windows 11)

## Installation

1. Install the requirements above.
2. Back up your existing config folder: `C:\Users\<you>\.config\yasb`.
3. Copy the contents of this repo's `yasb` folder into `C:\Users\<you>\.config\yasb`.
4. Set your wallpaper folder in `config.yaml` (see [Configuration](#configuration)).
5. Press `Win + R`, run `shell:startup`, and create a shortcut to `run-wallpaper-theme.vbs` in that folder so the watcher starts at login.
6. Copy `komorebi.json`, `komorebi.bar.json` and `applications.json` to your Komorebi config folder and set the `KOMOREBI_CONFIG_HOME` environment variable to that folder.
7. Reload YASB from the tray icon.

## Configuration

**Wallpaper folder.** In `config.yaml`, change the path in two places to your own wallpaper directory:

- `widgets.home.options.menu_list` (the "Wallpapers" entry)
- `widgets.wallpapers.options.image_path`

**Widgets.** Edit the `bars.primary-bar.widgets` lists in `config.yaml` to add, remove or reorder widgets (`cpu` is included but commented out of the bar by default).

**Hotkeys**

| Keys | Action |
| --- | --- |
| `Alt + Space` | Open quick launch |
| `Ctrl + Alt + W` | Toggle wallpaper gallery |

## How it works

- `theme.css` defines the color variables (`--background`, `--accent`, `--text`, etc.). `styles.css` only references those variables and never hardcodes colors.
- `wallpaper-theme.ps1` polls the registry for the current wallpaper. When it changes, it copies `wallpaper-themes/<wallpaper name>.css` over `theme.css`.
- It then touches `styles.css` so YASB's stylesheet watcher reloads the bar.
- `run-wallpaper-theme.vbs` launches the script hidden. The startup shortcut from the install steps runs it on login.
- Activity is logged to `wallpaper-theme.log` in the same folder, which helps when a theme doesn't apply.

### Naming rule

The theme file name must match the wallpaper file name (without extension). For example, `Pictures\Wallpapers\blue lake.jpg` uses `wallpaper-themes\blue lake.css`. Wallpapers without a matching theme file leave the current theme untouched.

## Adding your own theme

1. Copy any file in `yasb/wallpaper-themes/` and rename it to match your wallpaper's file name.
2. Edit the color values:

| Variable | Used for |
| --- | --- |
| `--background` | Bar, popups and island background |
| `--background2` | Buttons, cards and secondary surfaces |
| `--accent` | Active workspace, highlights, primary buttons |
| `--accentText` | Text drawn on top of `--accent` |
| `--text` | Main text and icons |
| `--subtext` | Secondary text (artist names, descriptions) |
| `--hover` | Hover and selected states |
| `--mutedBG` | Unchecked indicators and muted fills |
| `--border` | Island and popup borders |
| `--redFlash` | Accent hover color |

3. Set the wallpaper. The bar recolors within a couple of seconds.

## Repository layout

```
yasb/
  config.yaml              YASB bar and widget config
  styles.css               Styles (uses theme variables only)
  theme.css                Active theme (overwritten automatically)
  wallpaper-themes/        One .css palette per wallpaper
  wallpaper-theme.ps1      Wallpaper watcher
  run-wallpaper-theme.vbs  Hidden launcher for the watcher
komorebi.json              Komorebi config and workspace rules
komorebi.bar.json          Komorebi's built-in bar config
applications.json          Komorebi per-app rules
```

## Troubleshooting

- **Bar doesn't recolor:** check `wallpaper-theme.log` to see which wallpaper name was detected, and confirm a theme file with the exact same name exists.
- **Icons look like empty boxes:** install JetBrainsMono Nerd Font Propo.
- **Workspaces missing:** make sure Komorebi is running and `KOMOREBI_CONFIG_HOME` is set, then restart Komorebi.

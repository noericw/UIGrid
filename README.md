# UIGrid - WoW Classic Alignment Grid Addon

A lightweight addon that displays a customizable alignment grid overlay to help you position UI elements precisely in World of Warcraft Classic.

## Features

- **Customizable Grid Spacing** - Adjust grid spacing from 8px to 128px
- **Opacity Control** - Set grid transparency from 10% to 100%
- **Minimap Button** - Quick access to grid controls
- **Multi-Language Support** - English, French, and German translations
- **Persistent Settings** - Your configuration is saved between sessions
- **Draggable Interface** - Move the configuration window anywhere on screen
- **Lightweight** - Minimal performance impact

## Installation

1. Download the addon
2. Extract the `UIGrid` folder to your `World of Warcraft/_classic_/Interface/AddOns/` directory
3. Restart WoW or type `/reload` in-game
4. The addon will display a load message: "UIGrid loaded! Type /grid to open configuration"

## Usage

### Quick Start

- Type `/grid` to open the configuration window
- Check the "Show Grid" box to display the grid overlay
- Adjust spacing and opacity sliders to your preference
- Use the minimap button for quick access

### Minimap Button

- **Left Click** - Opens configuration window
- **Right Click** - Toggles grid on/off
- **Drag** - Repositions the minimap button

### Configuration Window

The configuration interface includes:
- **Show Grid Checkbox** - Toggle grid visibility
- **Spacing Slider** (8-128px) - Adjust distance between grid lines
- **Opacity Slider** (10-100%) - Control grid transparency
- **Language Dropdown** - Switch between English, French, and German
- **Help Button** - Display help information
- **Reset Button** - Restore default settings
- **Close Button** - Close the window

## / Commands

| Command | Description |
|---------|-------------|
| `/grid` | Opens the configuration interface |
| `/grid toggle` | Toggles the grid on/off directly |
| `/grid spacing <number>` | Sets grid spacing (e.g., `/grid spacing 64`) |
| `/grid minimap` | Shows/hides the minimap button |
| `/grid help` | Displays help information |
| `/uigrid` | Alternative command (same as `/grid`) |

## Supported Languages

- **English** (enUS) - Default
- **Français** (frFR)
- **Deutsch** (deDE)

The addon automatically detects your game language, but you can change it at any time via the dropdown menu in the configuration window.

## Default Settings

- **Spacing**: 32 pixels
- **Opacity**: 30%
- **Grid Color**: White
- **Language**: English
- **Minimap Button**: Visible

---
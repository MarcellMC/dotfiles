# Tmux Cheatsheet - Personal Config

**Prefix Key:** `Ctrl+a` (custom, not default `Ctrl+b`)

---

## Sessions

| Command | Description |
|---------|-------------|
| `tmux` | Start new session |
| `tmux new -s <name>` | Start new session with name |
| `tmux ls` | List sessions |
| `tmux attach -t <name>` | Attach to session |
| `Ctrl+a d` | Detach from session |
| `Ctrl+a $` | Rename session |
| `Ctrl+a s` | List and switch sessions |

---

## Windows (Tabs)

**Note:** Windows start at index 1 (not 0)

| Command | Description |
|---------|-------------|
| `Ctrl+a c` | Create new window |
| `Ctrl+a ,` | Rename current window |
| `Ctrl+a w` | List windows |
| `Ctrl+a n` | Next window |
| `Ctrl+a p` | Previous window |
| `Ctrl+a [0-9]` | Switch to window 1-9 |
| `Ctrl+a &` | Kill current window |

---

## Panes (Splits)

**Note:** Panes start at index 1 (not 0)

### Creating Panes
| Command | Description |
|---------|-------------|
| `Ctrl+a \|` | Split vertically (custom) |
| `Ctrl+a -` | Split horizontally (custom) |

### Navigating Panes
| Command | Description |
|---------|-------------|
| `Ctrl+a ←→↑↓` | Move to pane (arrow keys) |
| `Ctrl+a o` | Cycle through panes |
| `Ctrl+a q` | Show pane numbers |
| `Ctrl+a q [0-9]` | Jump to pane by number |

### Resizing Panes
| Command | Description |
|---------|-------------|
| `Ctrl+a Ctrl+←→↑↓` | Resize pane (hold Ctrl) |

### Managing Panes
| Command | Description |
|---------|-------------|
| `Ctrl+a x` | Kill current pane |
| `Ctrl+a z` | Toggle pane zoom (fullscreen) |
| `Ctrl+a {` | Move pane left |
| `Ctrl+a }` | Move pane right |
| `Ctrl+a Space` | Toggle pane layouts |

---

## Copy Mode (Scrollback)

| Command | Description |
|---------|-------------|
| `Ctrl+a [` | Enter copy mode |
| `q` | Exit copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `Ctrl+a ]` | Paste |

---

## Config & Misc

| Command | Description |
|---------|-------------|
| `Ctrl+a r` | Reload tmux config (custom) |
| `Ctrl+a ?` | List all keybindings |
| `Ctrl+a t` | Show clock |
| `Ctrl+a :` | Enter command mode |

---

## Features Enabled

- ✓ **Mouse mode** - Click to select panes, drag to resize, scroll to navigate
- ✓ **Windows/panes start at 1** (not 0)
- ✓ **Auto-rename disabled** - Window names stay as you set them
- ✓ **Catppuccin Mocha theme** - Status bar at top
- ✓ **Prefix indicator** - Status bar shows red when prefix is active, green when idle

---

## Tmuxinator

| Command | Description |
|---------|-------------|
| `tmuxinator start <project>` | Start tmuxinator project |
| `tmuxinator edit <project>` | Edit project config |
| `tmuxinator list` | List all projects |
| `tx` | Alias for tmuxinator |

---

## Tips

1. **Mouse support:** You can click panes to switch, drag borders to resize, and scroll to navigate history
2. **Prefix indicator:** Watch the status bar - it turns red when you press `Ctrl+a`, green when idle
3. **Quick reload:** After editing config, press `Ctrl+a r` to reload
4. **Zoom pane:** `Ctrl+a z` toggles fullscreen for current pane (great for focusing)
5. **Copy mode:** Use `Ctrl+a [` to scroll back and copy text with keyboard

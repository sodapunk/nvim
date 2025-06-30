# tmux + Neovim Complete Cheatsheet

> **Prefix**: `Ctrl + a` (instead of default `Ctrl + b`)

---

## 📋 Table of Contents

1. [Core tmux Concepts](#core-tmux-concepts)
2. [Prefix & Quick Help](#prefix--quick-help)
3. [Session Management](#session-management)
4. [Window & Pane Management](#window--pane-management)
5. [Pane Navigation](#pane-navigation)
6. [Copy & Paste & Scrollback](#copy--paste--scrollback)
7. [Zoom, Synchronize & Misc Pane Commands](#zoom-synchronize--misc-pane-commands)
8. [Plugin Management (TPM)](#plugin-management-tpm)
9. [Config Reload & Command Prompt](#config-reload--command-prompt)
10. [Status Bar Customization](#status-bar-customization)
11. [Integration with Neovim](#integration-with-neovim)
12. [Best Practices & Automation Scripts](#best-practices--automation-scripts)

---

## Core tmux Concepts

- **Server** = tmux daemon running in the background.
- **Session** = a single workspace (can hold many windows/panes).
- **Window** = a tab inside a session.
- **Pane** = a split inside a window.

Everything you do lives in a session; you can detach/reattach at will.

---

## Prefix & Quick Help

| Action                       | Binding        |
| ---------------------------- | -------------- |
| Send tmux command prompt     | `<prefix> + :` |
| List all key bindings (help) | `<prefix> + ?` |
| Show pane numbers            | `<prefix> + q` |

---

## Session Management

| Action                       | Command / Binding                                |
| ---------------------------- | ------------------------------------------------ |
| Create new session           | `tmux new -s <name>`                             |
| List sessions                | `tmux ls`                                        |
| Attach to session            | `tmux attach -t <name>`                          |
| Detach (from inside)         | `<prefix> + d`                                   |
| Kill session                 | `tmux kill-session -t <name>`                    |
| Rename current session       | `<prefix> + $`                                   |
| Choose session interactively | `<prefix> + S` _(bind: `bind S choose-session`)_ |
| Switch to last session       | `<prefix> + l` _(lowercase L)_                   |

---

## Window & Pane Management

### Windows

| Action                      | Binding                          |
| --------------------------- | -------------------------------- |
| New window                  | `<prefix> + c`                   |
| Close window                | `<prefix> + &`                   |
| Rename window               | `<prefix> + ,`                   |
| Next / Previous window      | `<prefix> + n` / `p`             |
| Jump to window by index     | `<prefix> + <num>`               |
| Choose window interactively | `<prefix> + w` _(choose-window)_ |

### Panes

| Action                       | Binding                   |
| ---------------------------- | ------------------------- | --- |
| Vertical split               | `<prefix> +               | `   |
| Horizontal split             | `<prefix> + -`            |
| Kill current pane            | `<prefix> + x`            |
| Evenly balance all panes     | `<prefix> + =`            |
| Break pane into a new window | `<prefix> + !`            |
| Join pane (from outside)     | `tmux join-pane -s <src>` |

---

## Pane Navigation

Navigate using Vim-like keys:

```text
<prefix> + h → left pane
<prefix> + j → down pane
<prefix> + k → up pane
<prefix> + l → right pane

```

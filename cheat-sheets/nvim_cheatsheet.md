# Neovim Core Motions & Commands Cheat Sheet

> A one-stop reference taken from beginner to expert: everything from basic cursor moves to advanced operator-text-object combos, surrounds, viewport motions, macros, splits, plugin integrations, and essential tips.  
> **⚠️ Case Sensitivity Matters:** Many commands behave differently when capitalized. For example, `w` vs `W`, `b` vs `B`, `e` vs `E`, `d$` vs `D`, and so on. Always note uppercase vs lowercase for correct motions.

---

## 📖 Table of Contents

1. [Modes & Exiting](#modes--exiting)  
2. [Counts & Intuition](#counts--intuition)  
3. [Basic Cursor Motions](#basic-cursor-motions)  
4. [Line & File Motions](#line--file-motions)  
5. [Scroll & Viewport Motions](#scroll--viewport-motions)  
6. [Search & Repeat](#search--repeat)  
7. [Marks & Jumps](#marks--jumps)  
8. [Visual Selection](#visual-selection)  
9. [Operators & Text Objects](#operators--text-objects)  
10. [Common Operator-Motion Chains](#common-operator-motion-chains)  
11. [Surrounds & Wrapping](#surrounds--wrapping)  
12. [End-of-Line & Insert-Mode Motions](#end-of-line--insert-mode-motions)  
13. [Registers & Macros](#registers--macros)  
14. [Window, Split & Tab Management](#window-split--tab-management)  
15. [Command-Line Mode & Substitutions](#command-line-mode--substitutions)  
16. [Plugins & Handy Combos](#plugins--handy-combos)  
17. [Putting It Into Practice](#putting-it-into-practice)

---

## Modes & Exiting

| Mode               | Enter                                   | Exit               | Intuition / Example                   |
|--------------------|-----------------------------------------|--------------------|---------------------------------------|
| **Normal**         | `Esc`, `<C-[>`                          | —                  | Navigation & commands                 |
| **Insert**         | `i` / `I` / `a` / `A` / `o` / `O`       | `Esc`              | Insert before/after cursor/line ends  |
| **Visual**         | `v` / `V` / `<C-v>`                     | `Esc`              | Select characters / lines / blocks    |
| **Command-Line**   | `:`                                     | `Enter`, `Esc`     | Run Ex commands (e.g. `:w`, `:s`)     |
| **Operator-pending** | after `d`, `c`, `y`, `>`              | applies with next motion               |

---

## Counts & Intuition

| Count + Command | Example | Effect                                    | Why Use It?                            |
|-----------------|---------|-------------------------------------------|----------------------------------------|
| `5j`            | `5j`    | Move down 5 lines                         | Avoid repeated taps                   |
| `3dw`           | `3dw`   | Delete 3 words                            | Bulk delete without visual select     |
| `2>>`           | `2>>`   | Indent line twice                         | Fast re-indent                        |

> **Tip:** Prepend any motion or operator with a number to repeat it.

---

## Basic Cursor Motions

| Motion            | Example | Description                                              |
|-------------------|---------|----------------------------------------------------------|
| `h`, `j`, `k`, `l`    | `4h`    | ← ↓ ↑ →  movement                                        |
| `w` / `W`         | `w`, `W`| Next word start (punctuation vs whitespace-delimited)    |
| `e` / `E`         | `e`, `E`| End of word (small vs big WORD)                         |
| `b` / `B`         | `b`, `B`| Back to word start (small vs big WORD)                  |
| `f<char>` / `t<char>` | `f;`    | Jump to / before next `<char>`                           |
| `;` / `,`         | `;`, `,`| Repeat last `f`/`t` forward / backward                   |
| `%`               | `%`     | Jump between matching `()`, `[]`, `{}`                  |
| `H` / `M` / `L`   | `H`     | Move to top / middle / bottom line of screen            |

---

## Line & File Motions

| Motion           | Example       | Description                                         |
|------------------|---------------|-----------------------------------------------------|
| `0`              | `0`           | Go to column 1                                      |
| `^`              | `^`           | Go to first non-blank                               |
| `$` / `D`        | `$`, `D`      | End of line / delete to end (same as `d$`)          |
| `gg` / `G`       | `gg`, `G`     | Top / bottom of file (`50G` → line 50)              |
| `zz` / `zt` / `zb` | `zz`         | Redraw: center / top / bottom current line          |

---

## Scroll & Viewport Motions

| Command   | Example | Description                                |
|-----------|---------|--------------------------------------------|
| `<C-d>`   | `<C-d>` | Scroll down half-page                      |
| `<C-u>`   | `<C-u>` | Scroll up half-page                        |
| `<C-f>`   | `<C-f>` | Scroll down full page                      |
| `<C-b>`   | `<C-b>` | Scroll up full page                        |
| `z.`      | `z.`    | Redraw & center cursor                     |
| `zt`, `zb`| `zb`    | Scroll current line to top/bottom of view  |

---

## Search & Repeat

| Command        | Example      | Description                                 |
|----------------|--------------|---------------------------------------------|
| `/pattern`     | `/TODO`      | Search forward                              |
| `?pattern`     | `?function`  | Search backward                             |
| `n` / `N`      | `n`, `N`     | Next / previous match                       |
| `*` / `#`      | `*`, `#`     | Search word under cursor (forward/backward) |
| `.`            | `.`          | Repeat last change                          |

---

## Marks & Jumps

| Command           | Example   | Description                                   |
|-------------------|-----------|-----------------------------------------------|
| `m[a–z]`          | `ma`      | Set mark `a` at cursor                         |
| `` `[a]``         | `` `a``   | Jump to cursor position of mark `a`            |
| `'<a>`            | `'<a>`    | Jump to beginning of marked line               |
| `` '' ``          | `''`      | Jump back to previous cursor location          |
| `<C-o>` / `<C-i>` | `<C-o>`   | Older / newer jump in jumplist                 |

---

## Visual Selection

| Command               | Example | Description                                     |
|-----------------------|---------|-------------------------------------------------|
| `v` / `V` / `<C-v>`   | `v`     | Enter char / line / block selection             |
| `o`                   | `o`     | Move to other end of selection                  |
| `gv`                  | `gv`    | Reselect last visual area                       |
| Apply operator        | `d`, `y`, `>` on selection| Delete / yank / indent selection        |

---

## Operators & Text Objects

| Operator     | Example    | Description                           |
|--------------|------------|---------------------------------------|
| `d`          | `dw`       | Delete                                |
| `c`          | `ciw`      | Change inner word (delete + insert)   |
| `y`          | `yaw`      | Yank around word                      |
| `>` / `<`    | `>ap`      | Indent / unindent around paragraph    |
| `gU` / `gu`  | `gUiw`     | Uppercase / lowercase inner word      |

### Text Objects

| Object              | Inner (i…)  | Around (a…) | Example   |
|---------------------|-------------|-------------|-----------|
| word                | `iw`        | `aw`        | `ciw`     |
| sentence            | `is`        | `as`        | `das`     |
| paragraph           | `ip`        | `ap`        | `yap`     |
| `(...)` `[...]` `{}`| `i(` `i[` `i{`| `a(` `a[` `a{` | `di(`  |
| quotes `"`, `'`, `\``| `i"` `i'` `i\``| `a"` `a'` `a\``| `cs"'`|

---

## Common Operator-Motion Chains

| Chain    | Example | Description                         |
|----------|---------|-------------------------------------|
| `dw`     | `dw`    | Delete next word                    |
| `daw`    | `daw`   | Delete word + space                 |
| `ciw`    | `ciw`   | Change inner word                   |
| `di(`    | `di(`   | Delete inside parentheses           |
| `yap`    | `yap`   | Yank paragraph                      |
| `>ap`    | `>ap`   | Indent paragraph                    |
| `3>>`    | `3>>`   | Indent line 3×                      |
| `d$`     | `d$`    | Delete to end of line               |
| `D`      | `D`     | Delete to end of line (same as `d$`)|
| `c$`     | `c$`    | Change to end of line               |
| `C`      | `C`     | Change to end of line (delete+insert)|
| `gUiw`   | `gUiw`  | Uppercase inner word                |

---

## Surrounds & Wrapping

> **Using `mini.surround` or `nvim-surround`**

| Action          | Example         | Description                                |
|-----------------|-----------------|--------------------------------------------|
| add surround    | `gsa(` or `ysa(`| Wrap object in parentheses                 |
| delete surround | `gsd"` or `ds"`| Remove quotes around object                |
| replace surround| `gsr'"` or `cs'"` | Change single→double quotes             |

---

## End-of-Line & Insert-Mode Motions

| Command     | Example | Description                                  |
|-------------|---------|----------------------------------------------|
| `A`         | `A`     | Append at end of line (enter Insert mode)     |
| `I`         | `I`     | Insert at first non-blank (enter Insert)      |
| `o` / `O`   | `o`, `O`| Open new line below / above                   |
| `<C-o>`     | `<C-o>` | Execute one Normal command in Insert mode     |
| `<C-w>`     | `<C-w>` | Delete last word in Insert                   |
| `<C-u>`     | `<C-u>` | Delete to start of Insert line               |
| `C`         | `C`     | Change to end of line (shortcut for `c$`)     |

---

## Registers & Macros

| Command      | Example   | Description                          |
|--------------|-----------|--------------------------------------|
| `"ayw`      | `"ayw`   | Yank word into register `a`          |
| `"ap`       | `"ap`    | Paste from register `a`              |
| `qa ... q`   | `qaabcq`  | Record macro `a`, type `abc`, stop   |
| `@a` / `@@`  | `@a`      | Play macro `a` / repeat last macro   |

> **Tip:** Use `0-9` registers for yank history, `+` for system clipboard.

---

## Window, Split & Tab Management

| Action                 | Example                   | Description                              |
|------------------------|---------------------------|------------------------------------------|
| `:split` / `:sp`       | `:sp file.txt`            | Horizontal split + open file             |
| `:vsplit` / `:vs`      | `:vs main.c`              | Vertical split + open file               |
| `<C-w> h/j/k/l`        | `<C-w>l`                  | Move between windows                     |
| `<C-w> +`/`-`/`>`/`<`  | `<C-w>5>`                 | Resize pane (+5 cols)                    |
| `<C-w> c` or `:q`      | `<C-w>c`                  | Close current window/pane                |
| `:tabnew`              | `:tabnew index.html`      | Open file in new tab                     |
| `:tabnext`/`:tabprev`  | `:tabnext`                | Switch tabs                              |
| `:tabclose` / `:tabs`  | `:tabs`                   | Close tab / list tabs                    |

---

## Command-Line Mode & Substitutions

| Command                   | Example                                      | Description                                |
|---------------------------|----------------------------------------------|--------------------------------------------|
| `:w`, `:q`, `:wq`, `:x`    | `:w`                                         | Write, quit, write+quit                    |
| `:e {file}`               | `:e README.md`                               | Open/edit file                             |
| `:b {buf}` / `:bn`, `:bp` | `:bn`                                        | Next/prev buffer                           |
| `:%s/{from}/{to}/gI`      | `:%s/foo/bar/gI`                             | Replace all (case-insensitive)             |
| `:.,.+5s/{from}/{to}/g`   | `:.,.+5s/old/new/g`                          | Replace in next 5 lines                    |
| `:g/{pattern}/norm yf{`   | `:g/TODO/norm yf:`                           | Yank to `:` for all TODO lines             |
| `:<num>`                  | `:42`                                        | Jump to line 42                            |

> **Tip:** Use `\<<C-r><C-w>\>` in `:%s` to fill word under cursor.

---

## Plugins & Handy Combos

| Plugin / Feature       | Example                                  | Description                                        |
|------------------------|------------------------------------------|----------------------------------------------------|
| `hop.nvim`             | `:lua require('hop').hint_words()`       | Multi-char / word jump hints                       |
| `leap.nvim`            | `s`                                      | Two-key buffer jump                                |
| `spectre.nvim`         | `:lua require('spectre').open()`         | Project-wide search & replace UI                   |
| `telescope.nvim`       | `<leader>ff`                             | Fuzzy file finder                                  |
| `mini.surround`        | `gsa)`                                   | Wrap selection in parentheses                      |
| `nvim-ufo`             | `zR` / `zM`                              | Open / close all folds                             |

---

## Putting It Into Practice

1. **Master one section at a time** — focus: motions → operators → text objects → macros.
2. **Use counts** — practice `5j` instead of `jjjjj`.
3. **Map leader combos** for surrounds, Telescope, Spectre.
4. **Record macros** for repetitive edits.
5. **Combine** built-ins with plugins for maximum speed.

> *Happy modal editing!* 🚀


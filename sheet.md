
# Neovim Core Motions Cheat Sheet

A focused reference for essential Normal, Visual, and Operator-Pending commands, text objects, and useful key-chains.

---

## Modes

| Mode             | Enter                                  | Exit                         |
| ---------------- | -------------------------------------- | ---------------------------- |
| Normal           | `Esc`                                  | --                           |
| Insert           | `i` / `a` / `o`                        | `Esc`                        |
| Visual           | `v` / `V` / `<C-v>`                    | `Esc`                        |
| Operator-pending | after an operator (e.g. `d`, `c`, `y`) | completes motion/text-object |

---

## Basic Cursor Movements

| Keys            | Description                                |
| --------------- | ------------------------------------------ |
| `h j k l`       | Left, down, up, right                      |
| `w` / `e` / `b` | Next word start / end / back               |
| `0` / `^` / `$` | Line start / first non-blank / end of line |
| `gg` / `G`      | Top / bottom of file                       |
| `fx` / `tx`     | Move to / before character `x`             |
| `;` / `,`       | Repeat last `f`/`t` forward/backward       |
| `%`             | Jump between matching `()` `[]` `{}`       |

---

## Operators & Motions

Operators act on motions or text objects:

| Operator  | Action                   | Example                          |
| --------- | ------------------------ | -------------------------------- |
| `d`       | delete                   | `dw` (delete to next word start) |
| `c`       | change (delete + insert) | `ciw` (change inner word)        |
| `y`       | yank (copy)              | `y$` (yank to end of line)       |
| `>` / `<` | indent / unindent        | `>ap` (indent a paragraph)       |

**Combine**: `operator` + `motion` or `operator` + `text-object`.

---

## Text Objects

Operate on syntactic units with `i` (inner) and `a` (around):

| Object                          | `i` (inner)           | `a` (around)          | Example: `diw` → delete word            |
| ------------------------------- | --------------------- | --------------------- | --------------------------------------- |
| Word                            | `iw`                  | `aw`                  | `caw` → change a word (including space) |
| Sentence                        | `is`                  | `as`                  | `das` → delete a sentence               |
| Paragraph                       | `ip`                  | `ap`                  | `yap` → yank a paragraph                |
| Parentheses / brackets / braces | `i(` `i[` `i{`        | `a(` `a[` `a{`        | `dit(` → delete inside `(...)`          |
| Quotes                          | `i"` / `i'` / ``i` `` | `a"` / `a'` / ``a` `` | `ci"` → change inside quotes            |

**Outer vs Inner**: e.g.,

- `vi(` → visual inner parentheses
- `va(` → visual around parentheses

---

## Combining Example Chains

| Sequence | Effect                                   |
| -------- | ---------------------------------------- |
| `cit(`   | Change inside parentheses → enter Insert |
| `di"`    | Delete inside quotes                     |
| `yap`    | Yank around paragraph                    |
| `>ap`    | Indent around paragraph                  |
| `yaw`    | Yank around word (including space)       |
| `v2w`    | Visual select two words                  |
| `d$`     | Delete to end of line                    |
| `ciw`    | Change inner word                        |
| `daB`    | Delete around block `{ ... }`            |

---

## Search & Repeat

| Command    | Description                         |
| ---------- | ----------------------------------- |
| `/pattern` | Search forward                      |
| `?pattern` | Search backward                     |
| `n` / `N`  | Next / previous match               |
| `*` / `#`  | Search word under cursor fwd / back |
| `.`        | Repeat last change                  |

---

## Marks & Jumps

- `m<letter>`: set mark (e.g. `ma`)
- `'<letter>`: jump to beginning of marked line
- `` `<letter>` ``: jump to exact mark position
- `''`: jump to previous jump spot
- `<C-o>` / `<C-i>`: older / newer jumps in jumplist

---

## Visual Selection Tips

- `v` then move → character-wise selection
- `V` → line-wise selection
- `<C-v>` → block-wise selection
- Use operators: `d`, `y`, `c` on selection
- Combine with text objects: `va"` → select around quotes

---

## Macros & Registers

- `q<register>` → start recording (e.g. `qa`)
- `q` → stop recording
- `@<register>` → play back (e.g. `@a`)
- `@@` → repeat last macro
- `"<register>p` → paste from register

---

## Windows & Tabs

| Command             | Description          |
| ------------------- | -------------------- |
| `:split` / `:sp`    | Horizontal split     |
| `:vsplit` / `:vs`   | Vertical split       |
| `<C-w>h/j/k/l`      | Move between windows |
| `:tabnew`           | New tab              |
| `:tabnext` / `:tn`  | Next tab             |
| `:tabclose` / `:tc` | Close current tab    |

---

## Tips & Further Reading

- `:help motion` for all built-in motions
- `:help text-objects` for deeper text-object info
- Combine `count` before commands (`3dw`, `5j`)
- Practice with `vimtutor` for interactive lessons

---

\**Happy modal editing!* 🚀

## Useful Edit Chains: Wrapping Function Calls

### Wrap an existing call in another function

Transform:

```lua
j = input(
    "j ="
)
```

into:

```lua
j = int(input(
    "j ="
))
```

Steps using built-in motions:

1. `f(` → jump to the `(` before `input`
2. `iint` → insert `int` before the `(` (goes into Insert mode, types `int`, returns to Normal)
3. `<Esc>` → ensure you’re in Normal mode
4. `%` → jump to the matching `)`
5. `a)` → append a closing parenthesis after it

Keychain: `f(iint<Esc>%a)<Esc>`

> **Tip:** You can record this as a macro (`qa` … actions … `q`) for repeated use.

### Visual-selection wrapper (with mini.surround)

If you have a plugin like mini.surround with `gsa` bound:

1. Select inner call: `vi(`
2. Add surround: `gsa(` → wraps selection in `(`…`)`
3. With cursor on call, prepend `int` and append `)` as above.

### Other speed-ups

- **Macros**: use `q<register>` to record and `@<register>` to replay common sequences.
- **Abbreviations**: map frequent snippets via `:iabbrev fnc function`.
- **Registers**: `"`x`p` to paste from register `x`.
- **Marks**: `ma` to mark, `` `<a>` `` to return.
- **Text-objects**: master `iw`, `ap`, `i{`/`a{` for fast selections.
- **Counts**: prefix commands with numbers (e.g. `5j`, `3dw`).

---

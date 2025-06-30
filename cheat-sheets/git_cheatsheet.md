# Git SSH, Sync & Checkout Cheatsheet

> Your go-to reference from SSH setup to advanced branch & repo management.

---

## 📖 Table of Contents

1. [SSH Key Setup](#ssh-key-setup)
2. [Clone & Fetch](#clone--fetch)
3. [Remote URL Management](#remote-url-management)
4. [Sync Commands](#sync-commands)
5. [Branch & File Management](#branch--file-management)
6. [Common Workflows](#common-workflows)
7. [Merging & Rebasing](#merging--rebasing)
8. [Stashing](#stashing)
9. [Tags & Releases](#tags--releases)
10. [Submodules](#submodules)
11. [Worktrees](#worktrees)
12. [Bisecting](#bisecting)
13. [Reflog & Recovery](#reflog--recovery)
14. [Blame & Annotate](#blame--annotate)
15. [Cherry-Pick & Revert](#cherry-pick--revert)
16. [Hooks](#hooks)
17. [Configuration & Aliases](#configuration--aliases)
18. [Pro Tips & Visualization](#pro-tips--visualization)
19. [Appendix: Visual Flow Diagrams](#appendix-visual-flow-diagrams)

---

## SSH Key Setup

| Action                    | Command                                               | Description                                       |
| ------------------------- | ----------------------------------------------------- | ------------------------------------------------- |
| Check for existing key    | `ls ~/.ssh/id_ed25519.pub`                            | Verify if you already have an ED25519 public key. |
| Generate new key          | `ssh-keygen -t ed25519 -C "your_email@example.com"`   | Create a new key; follow prompts.                 |
| Copy public key (macOS)   | `pbcopy < ~/.ssh/id_ed25519.pub`                      | Copy to clipboard.                                |
| Copy public key (Linux)   | `xclip -selection clipboard < ~/.ssh/id_ed25519.pub`  | Copy to clipboard.                                |
| Add key to agent          | `ssh-add ~/.ssh/id_ed25519`                           | Ensure ssh-agent can use your key.                |
| Register on GitHub/GitLab | Paste key under **Settings → SSH Keys** on the web UI | Grant SSH access to your account.                 |

---

## Clone & Fetch

| Action           | Command                                      | Description                                       |
| ---------------- | -------------------------------------------- | ------------------------------------------------- |
| Clone via SSH    | `git clone git@github.com:USER/REPO.git`     | Securely clone a repo over SSH.                   |
| Clone via HTTPS  | `git clone https://github.com/USER/REPO.git` | Use HTTPS URL if SSH unavailable.                 |
| Change into repo | `cd REPO`                                    | Navigate into the project directory.              |
| Fetch updates    | `git fetch --all --prune`                    | Download all remotes and remove deleted branches. |
| Pull updates     | `git pull --rebase`                          | Fetch + rebase onto current branch.               |

---

## Remote URL Management

| Action        | Command                                                    | Description                                |
| ------------- | ---------------------------------------------------------- | ------------------------------------------ |
| View remotes  | `git remote -v`                                            | List names and URLs of configured remotes. |
| Add a remote  | `git remote add upstream git@github.com:ORIGINAL/REPO.git` | Track original fork or secondary remote.   |
| Change URL    | `git remote set-url origin git@github.com:USER/REPO.git`   | Switch origin to SSH or new location.      |
| Remove remote | `git remote remove upstream`                               | Delete an unwanted remote entry.           |

---

## Sync Commands

| Command                   | Description                                            |
| ------------------------- | ------------------------------------------------------ |
| `git fetch --all --prune` | Download updates, clean stale branches across remotes. |
| `git pull --rebase`       | Fetch + rebase local commits onto fetched branch.      |
| `git pull --ff-only`      | Only fast-forward; fail if merge required.             |
| Custom sync alias:        | `git config --global alias.sync "pull --rebase"`       |

---

## Branch & File Management

| Action                         | Command                                | Description                                   |
| ------------------------------ | -------------------------------------- | --------------------------------------------- |
| Create & switch branch         | `git checkout -b feature/foo`          | Shortcut to create & checkout new branch.     |
| Switch branches (modern)       | `git switch feature/foo`               | Explicit switch without creating.             |
| Create branch without checkout | `git branch bugfix/123`                | Prepare branch name for later use.            |
| Delete branch (local)          | `git branch -d feature/foo`            | Fails if branch unmerged.                     |
| Delete branch (force)          | `git branch -D temp`                   | Force delete even if unmerged.                |
| Delete remote branch           | `git push origin --delete feature/foo` | Remove branch from remote.                    |
| Restore file to HEAD           | `git restore path/to/file`             | Discard local edits to one file.              |
| Restore all working tree       | `git restore .`                        | Discard edits across whole working directory. |

---

## Common Workflows

| Step                      | Commands                                     | Description                                            |
| ------------------------- | -------------------------------------------- | ------------------------------------------------------ |
| Start feature branch      | `git switch -c feature/NAME`                 | Create & checkout in one go.                           |
| Rebase onto upstream main | `git fetch origin && git rebase origin/main` | Keep history linear by rebasing.                       |
| Stage changes             | `git add -p`                                 | Interactively stage hunks.                             |
| Commit with message       | `git commit -m "feat: add login"`            | Use Conventional Commits style.                        |
| Push & set upstream       | `git push -u origin feature/NAME`            | Push branch and track remote.                          |
| Create PR                 | `gh pr create --fill`                        | Use GitHub CLI to open PR with auto-filled title/body. |

---

## Merging & Rebasing

| Action                             | Commands                                                   | Description                                             |
| ---------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------- |
| Merge feature into current         | `git merge feature/foo`                                    | Fast-forward or create merge commit.                    |
| Squash merge                       | `git merge --squash feature/foo && git commit`             | Combine all commits into one before committing.         |
| Start interactive rebase           | `git rebase -i HEAD~5`                                     | Reorder, squash, or edit last 5 commits.                |
| Skip a commit during rebase        | Mark row `pick` → `drop` in interactive editor             | Remove a commit from history.                           |
| Split a commit                     | `exec git reset HEAD^` + separate commits in rebase editor | Break one commit into multiple.                         |
| Abort rebase                       | `git rebase --abort`                                       | Cancel in-progress rebase and return to original state. |
| Continue after resolving conflicts | `git rebase --continue`                                    | Resume rebase after conflict resolution.                |

---

## Stashing

| Action             | Command                                 | Description                                |
| ------------------ | --------------------------------------- | ------------------------------------------ |
| Stash changes      | `git stash`                             | Save uncommitted changes to a stack.       |
| List stashes       | `git stash list`                        | View saved stash entries.                  |
| Apply latest stash | `git stash apply`                       | Reapply changes without dropping stash.    |
| Pop latest stash   | `git stash pop`                         | Apply + remove from stash list.            |
| Stash with message | `git stash save "WIP: refactor auth"`   | Tag stash for clarity.                     |
| Drop a stash       | `git stash drop stash@{2}`              | Remove a specific stash entry.             |
| Branch from stash  | `git stash branch bugfix/123 stash@{0}` | Create branch and apply stash in one step. |

---

## Tags & Releases

| Action                      | Command                                                  | Description                                           |
| --------------------------- | -------------------------------------------------------- | ----------------------------------------------------- |
| Create lightweight tag      | `git tag v1.2.0`                                         | Mark a commit with a simple tag.                      |
| Create annotated tag        | `git tag -a v1.2.0 -m "Release 1.2.0"`                   | Tag with message and metadata.                        |
| List tags                   | `git tag`                                                | Show all tags.                                        |
| Push tags                   | `git push --tags`                                        | Upload all tags to remote.                            |
| Checkout a tag              | `git checkout v1.2.0`                                    | Switch working tree to tagged commit (detached HEAD). |
| Delete tag (local & remote) | `git tag -d v1.2.0 && git push origin :refs/tags/v1.2.0` | Remove tag everywhere.                                |

---

## Submodules

| Action                 | Command                                                     | Description                                      |
| ---------------------- | ----------------------------------------------------------- | ------------------------------------------------ |
| Add submodule          | `git submodule add git@github.com:USER/dep.git path/to/dep` | Embed repo as subdirectory.                      |
| Init & update          | `git submodule update --init --recursive`                   | Clone & checkout submodules recursively.         |
| Pull submodule changes | `cd path/to/dep && git pull`                                | Update submodule to latest commit on its branch. |
| Remove submodule       | Remove folder + `git rm --cached path/to/dep`               | Clean submodule reference.                       |

---

## Worktrees

| Action              | Command                                        | Description                                        |
| ------------------- | ---------------------------------------------- | -------------------------------------------------- |
| Create new worktree | `git worktree add ../repo-feature feature/foo` | Checkout new branch in parallel working directory. |
| List worktrees      | `git worktree list`                            | Show all active worktrees.                         |
| Remove worktree     | `git worktree remove ../repo-feature`          | Unregister and clean up a worktree.                |

---

## Bisecting

| Action               | Command                    | Description                             |
| -------------------- | -------------------------- | --------------------------------------- |
| Start bisect         | `git bisect start`         | Begin bisection process.                |
| Mark bad commit      | `git bisect bad`           | Current commit is known-bad.            |
| Mark good commit     | `git bisect good v1.0`     | Known-good commit tag or hash.          |
| Automate test script | `git bisect run ./test.sh` | Run script to auto-check good/bad.      |
| Reset bisect         | `git bisect reset`         | End bisect and return to original HEAD. |

---

## Reflog & Recovery

| Action                | Command                     | Description                               |
| --------------------- | --------------------------- | ----------------------------------------- |
| View reflog           | `git reflog`                | Show history of HEAD moves.               |
| Reset to reflog entry | `git reset --hard HEAD@{3}` | Roll back to earlier HEAD state.          |
| Recover lost commit   | `git checkout HEAD@{5}`     | Access commit before an accidental reset. |

---

## Blame & Annotate

| Action                         | Command                     | Description                                   |
| ------------------------------ | --------------------------- | --------------------------------------------- |
| Show file blame                | `git blame path/to/file`    | Annotate each line with author & commit info. |
| Blame ignoring whitespace      | `git blame -w path/to/file` | Skip whitespace-only changes.                 |
| Show commit of a specific line | `git blame -L 50,50 file`   | Annotate only a single line.                  |

---

## Cherry-Pick & Revert

| Action               | Command                      | Description                                        |
| -------------------- | ---------------------------- | -------------------------------------------------- |
| Cherry-pick commit   | `git cherry-pick a1b2c3d`    | Apply that commit on current HEAD.                 |
| Cherry-pick multiple | `git cherry-pick a1b2..a1b5` | Range pick from a1b2 to a1b5.                      |
| Revert commit        | `git revert a1b2c3d`         | Create new commit that undoes the selected commit. |

---

## Hooks

| Hook             | Location                                   | Description                                                |
| ---------------- | ------------------------------------------ | ---------------------------------------------------------- |
| Pre-commit       | `.git/hooks/pre-commit`                    | Run lint/tests before commit; exit non-zero to block.      |
| Commit-msg       | `.git/hooks/commit-msg`                    | Enforce commit message format (e.g. Conventional Commits). |
| Post-merge       | `.git/hooks/post-merge`                    | e.g. auto-run `npm install` after merging.                 |
| Global hooks dir | `git config core.hooksPath /path/to/hooks` | Share hooks across multiple repos.                         |

---

## Configuration & Aliases

| Setting                     | Command                                                                                    | Description                               |
| --------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------- |
| Set global username/email   | `git config --global user.name "Name"``git config --global user.email "email@example.com"` | Identity for commits.                     |
| Configure rebase by default | `git config --global pull.rebase true`                                                     | `git pull` auto-rebases.                  |
| Create an alias             | `git config --global alias.co checkout`                                                    | `git co` → `git checkout`.                |
| List all config             | `git config --list`                                                                        | Show all git configs.                     |
| Set color UI                | `git config --global color.ui auto`                                                        | Enable colored output.                    |
| Ignore file patterns        | Add `.gitignore` in repo root                                                              | List files/dirs to exclude from tracking. |

---

## Pro Tips & Visualization

- **View branch graph**: `git log --all --decorate --oneline --graph`
- **Stash & apply quickly**: `git stash && git stash pop`
- **Interactive staging**: `git add -p` or `git add -i`
- **Squash last N commits**: `git rebase -i HEAD~N` and mark `squash`.
- **Bisect with script**: `git bisect run npm test`

---

## Appendix: Visual Flow Diagrams

**Merge vs Rebase**

```text
      A---B---C feature
     /         
D---E-----------F main (merge commit)
```

```text
D---E---A'---B'---C' feature (after rebase)
             
             main
```

*Keep this cheatsheet in your dotfiles for quick reference — happy coding!*


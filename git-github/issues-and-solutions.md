## Git & GitHub — Issues and Solutions

Practical fixes for common Git and GitHub problems. Commands assume Linux/zsh; adapt for your shell if needed.

---

### Quick checklist

- Check remotes: `git remote -v`
- Check status/branch: `git status`, `git branch -vv`
- Fetch latest: `git fetch --all --prune`
- Verify auth: HTTPS with PAT or SSH keys configured

---

### 1) Configure identity (name/email)

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
```

---

### 2) Authentication failures (403/401)

Symptoms: prompts for password, push fails with denied.

Options:

- HTTPS with Personal Access Token (PAT) instead of password
- SSH with keys

HTTPS (set remote with PAT once during prompt)

```bash
git remote set-url origin https://github.com/<user>/<repo>.git
git push
```

SSH (recommended)

```bash
ssh-keygen -t ed25519 -C "you@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub  # add to GitHub > Settings > SSH and GPG keys
git remote set-url origin git@github.com:<user>/<repo>.git
ssh -T git@github.com  # should say: You've successfully authenticated
```

---

### 3) Non-fast-forward / rejected pushes

Error: `! [rejected] ... non-fast-forward`

You and remote diverged. Integrate remote then push.

```bash
git fetch origin
git rebase origin/main   # or: git merge origin/main
git push                 # if rebase used remote branch name
```

To force (risk overwriting remote):

```bash
git push --force-with-lease
```

---

### 4) Set upstream for new branches

Error: `fatal: The current branch ... has no upstream branch.`

```bash
git push -u origin your-branch
```

---

### 5) Resolve merge conflicts

```bash
git fetch origin
git merge origin/main         # or rebase
# edit conflicted files <<<<<<< ======= >>>>>>>
git add <file>...
git commit                    # completes the merge
```

Abort merge/rebase if needed:

```bash
git merge --abort
git rebase --abort
```

---

### 6) Recover lost commits (reflog)

```bash
git reflog
git checkout <commit>
git switch -c rescue-branch  # keep the state
```

---

### 7) Wrong file committed (undo before push)

```bash
git reset HEAD~1             # undo last commit, keep changes staged
# or
git reset --soft HEAD~1      # keep staged
git reset --hard HEAD~1      # discard changes (danger)
```

Undo after push (rewrite history — coordinate with team):

```bash
git revert <commit_sha>
git push
```

---

### 8) Large files / LFS issues

Error: `file is 100.00 MB; this exceeds GitHub's file size limit`.

Use Git LFS:

```bash
sudo apt install -y git-lfs
git lfs install
git lfs track "*.bin"
git add .gitattributes *.bin
git commit -m "Track binaries with LFS"
git push
```

To remove accidentally committed large file from history:

```bash
git filter-repo --path bigfile.zip --invert-paths
git push --force-with-lease
```

Note: `git filter-repo` must be installed; alternatively, use `git filter-branch` (slower) or GitHub BFG.

---

### 9) Line endings (CRLF/LF) problems

Configure normalization:

```bash
git config --global core.autocrlf input   # on Linux/macOS
echo "* text=auto" >> .gitattributes
```

---

### 10) Repo not found / permission denied

Checklist:

- Correct remote URL: `git remote -v`
- Access rights to the org/repo
- Correct protocol (SSH vs HTTPS) and account

---

### 11) Safe directory error (root-owned repos)

Error: `fatal: detected dubious ownership in repository`.

```bash
git config --global --add safe.directory /path/to/repo
```

---

### 12) Proxy/SSL certificate issues

Corporate proxies often require:

```bash
git config --global http.proxy http://user:pass@proxy:port
git config --global https.proxy http://user:pass@proxy:port
```

Custom CA certificate:

```bash
git config --global http.sslCAInfo /path/to/cacert.pem
```

---

### 13) .gitignore not working

If a file is already tracked, ignoring won’t apply until removed from index:

```bash
echo "node_modules/" >> .gitignore
git rm -r --cached node_modules/
git add .gitignore
git commit -m "Respect .gitignore for node_modules"
```

---

### 14) Rename default branch

Local:

```bash
git branch -m master main
```

Remote:

```bash
git push origin -u main
git push origin --delete master
```

Update upstream tracking for others or set on GitHub repo settings.

---

### 15) Submodule pitfalls

Clone with submodules:

```bash
git clone --recurse-submodules <repo>
```

Fix outdated submodules:

```bash
git submodule update --init --recursive
```

---

### 16) Detached HEAD

```bash
git switch -c my-fix-branch     # create a branch from current commit
```

---

### 17) Protected branches / required checks

If push is blocked: open a PR to `main` and pass required status checks. Adjust branch protection in GitHub repository settings if you’re an admin.

---

### 18) Useful global configs

```bash
git config --global pull.rebase false
git config --global fetch.prune true
git config --global push.default simple
git config --global rerere.enabled true  # reuse recorded conflict resolution
```

---

### References

- Git Book: https://git-scm.com/book
- GitHub Docs: https://docs.github.com/
- Pro Git: https://git-scm.com/book/en/v2

> Tip: Always commit small, logical changes with clear messages and sync frequently to avoid complex merges.

## 🧭 Terminal Shortcuts & Aliases

Productive shell shortcuts for zsh/bash: quick navigation, safe file ops, Git helpers, search, and more. Use the ready-made `aliases.sh` or copy snippets below.

---

### Quick start (zsh on Linux)

1. Place or edit `terminal-shortcuts/aliases.sh` in this repo.

2. Source it from your zsh config:

```bash
# ~/.zshrc
source "$HOME/Documents/KaliDocs/terminal-shortcuts/aliases.sh"
```

3. Apply now without restarting shell:

```bash
source ~/.zshrc
```

4. Verify:

```bash
which ll
ll --help 2>/dev/null || ls -alF
```

For bash, use `~/.bashrc` instead of `~/.zshrc`.

---

### Suggested aliases (copy into `aliases.sh`)

Navigation and quality of life

```bash
# Safer, smarter defaults
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'

# Listing (prefer eza if installed, otherwise ls)
if command -v eza >/dev/null 2>&1; then
	alias ls='eza --group-directories-first --icons=auto'
	alias ll='eza -lah --group-directories-first --icons=auto'
	alias lt='eza -T --level=2 --icons=auto'
else
	alias ll='ls -alF'
	alias la='ls -A'
	alias lt='ls -R'
fi

# Quick dirs
alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
```

Safety and speed

```bash
# Confirm before destructive ops
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Fast search
if command -v rg >/dev/null 2>&1; then
	alias grep='rg'
fi
```

Git helpers

```bash
alias g='git'
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gco='git checkout'
alias gb='git branch -v'
```

Networking and system

```bash
alias myip='curl -s https://ipinfo.io/ip'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dfh='df -h'
alias duh='du -sh * 2>/dev/null | sort -h'
```

Archives

```bash
# Universal extractor
extract() {
	[ -f "$1" ] || { echo "Usage: extract <archive>"; return 1; }
	case "$1" in
		*.tar.bz2)   tar xjf "$1" ;;
		*.tar.gz)    tar xzf "$1" ;;
		*.tar.xz)    tar xJf "$1" ;;
		*.tar)       tar xf  "$1" ;;
		*.tbz2)      tar xjf "$1" ;;
		*.tgz)       tar xzf "$1" ;;
		*.zip)       unzip   "$1" ;;
		*.rar)       unrar x "$1" ;;
		*.7z)        7z x    "$1" ;;
		*)           echo "Don't know how to extract '$1'" ; return 2 ;;
	esac
}
```

Utilities

```bash
# Make dir and enter
mkcd() { mkdir -p "$1" && cd "$1"; }

# Quick web server in current folder
serve() { local port="${1:-8000}"; python3 -m http.server "$port"; }

# Pretty cat if bat is present
if command -v batcat >/dev/null 2>&1; then
	alias cat='batcat --style=plain'
elif command -v bat >/dev/null 2>&1; then
	alias cat='bat --style=plain'
fi
```

---

### Optional productivity tools

Install these for a nicer CLI experience (Kali/Debian):

```bash
sudo apt update
sudo apt install -y eza fzf zoxide ripgrep bat trash-cli
```

Enable fzf history search and zoxide smart cd:

```bash
# ~/.zshrc
eval "$(zoxide init zsh)"
source /usr/share/doc/fzf/examples/key-bindings.zsh 2>/dev/null || true
source /usr/share/doc/fzf/examples/completion.zsh 2>/dev/null || true
```

Tip: consider a prompt theme (e.g., powerlevel10k) for better status info.

---

### Structure of this folder

- `aliases.sh` — your aliases and functions to be sourced by the shell
- `README.md` — this guide

---

### Troubleshooting

- Edits not applying? Ensure you sourced the file and there are no syntax errors.
- zsh vs bash: put `source .../aliases.sh` in the correct rc file (`~/.zshrc` or `~/.bashrc`).
- Command not found: verify the tool is installed and in PATH.

---

Happy hacking. Keep aliases small, memorable, and safe.

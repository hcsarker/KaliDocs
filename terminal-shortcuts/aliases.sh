###############################################
# Terminal shortcuts & aliases (zsh/bash)
# Source from ~/.zshrc or ~/.bashrc:
#   source "$HOME/Documents/KaliDocs/terminal-shortcuts/aliases.sh"
###############################################

# Prevent double-loading
if [ -n "$ALIAS_PACK_LOADED" ]; then
	return 0 2>/dev/null || true
fi
export ALIAS_PACK_LOADED=1

# Detect shell flavor
if [ -n "$ZSH_VERSION" ]; then SHELL_FLAVOR=zsh;
elif [ -n "$BASH_VERSION" ]; then SHELL_FLAVOR=bash;
else SHELL_FLAVOR=sh; fi

###############################################
# Safer defaults
###############################################
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Common QoL
alias c='clear'
alias q='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

###############################################
# Listings (prefer eza; fallback to ls)
###############################################
if command -v eza >/dev/null 2>&1; then
	alias ls='eza --group-directories-first --icons=auto'
	alias ll='eza -lah --group-directories-first --icons=auto'
	alias la='eza -a --group-directories-first --icons=auto'
	alias lt='eza -T --level=2 --icons=auto'
else
	alias ll='ls -alF'
	alias la='ls -A'
	alias lt='ls -R'
fi

# Pretty cat if bat/batcat is present
if command -v batcat >/dev/null 2>&1; then
	alias cat='batcat --style=plain'
elif command -v bat >/dev/null 2>&1; then
	alias cat='bat --style=plain'
fi

# Fast grep if ripgrep exists
if command -v rg >/dev/null 2>&1; then
	alias grep='rg'
fi

###############################################
# Quick navigation helpers
###############################################
alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

mkcd() { mkdir -p "$1" && cd "$1"; }

# List PATH one per line
path() { echo "$PATH" | tr ':' '\n'; }

###############################################
# Networking & system
###############################################
alias myip='curl -s https://ipinfo.io/ip'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dfh='df -h'
alias duh='du -sh * 2>/dev/null | sort -h'

###############################################
# Archives
###############################################
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

targz() { tar -czf "${1%.tar.gz}.tar.gz" "$1"; }

###############################################
# Git helpers
###############################################
alias g='git'
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gco='git checkout'
alias gb='git branch -v'

###############################################
# Debian/Kali apt shortcuts
###############################################
alias sua='sudo apt update'
alias sug='sudo apt upgrade -y'
alias sau='sudo apt update && sudo apt upgrade -y'
alias sui='sudo apt install'
alias sar='sudo apt autoremove -y'
alias sac='sudo apt clean && sudo apt autoremove -y'

###############################################
# Docker (if installed)
###############################################
if command -v docker >/dev/null 2>&1; then
	alias d='docker'
	alias dps='docker ps'
	alias di='docker images'
	alias drm='docker rm'
	alias drmi='docker rmi'
	alias dlog='docker logs -f'
fi

###############################################
# Python & venv helpers
###############################################
venv() { python3 -m venv .venv && echo "Created .venv"; }
act()  { [ -f .venv/bin/activate ] && . .venv/bin/activate || echo "No .venv found"; }

###############################################
# Last-command with sudo (zsh/bash)
###############################################
pls() {
	if command -v fc >/dev/null 2>&1; then
		eval sudo $(fc -ln -1)
	else
		echo "History not available for pls()"
	fi
}

# Local HTTP server
serve() { local port="${1:-8000}"; python3 -m http.server "$port"; }

# End of aliases pack
return 0 2>/dev/null || true

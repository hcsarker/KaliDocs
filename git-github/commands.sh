#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Git/GitHub command toolkit (bash/zsh)
#
# How to use:
#   - Source into your shell to get aliases and helper functions:
#       source "$HOME/Documents/KaliDocs/git-github/commands.sh"
#   - Type gg_help to see available commands.
#
# Safe by default: destructive actions prompt for confirmation.
# -----------------------------------------------------------------------------

# Detect shell flavor (best-effort)
if [ -n "${ZSH_VERSION:-}" ]; then SHELL_FLAVOR=zsh; else SHELL_FLAVOR=bash; fi

# Idempotent load guard
if [ -n "${GG_TOOLKIT_LOADED:-}" ]; then
	return 0 2>/dev/null || true
fi
export GG_TOOLKIT_LOADED=1

# --- Aliases (quality of life) ------------------------------------------------
alias g='git'
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'
alias gpl='git pull'
alias gpf='git push --force-with-lease'
alias glog='git log --oneline --graph --decorate --all'
alias gdiff='git diff --minimal --patience'

# --- Helpers ------------------------------------------------------------------
_gg_confirm() {
	read -r -p "Proceed? [y/N] " ans; case "$ans" in [Yy]*) return 0;; *) echo "Aborted"; return 1;; esac
}

_gg_base_branch() {
	if git show-ref --verify --quiet refs/heads/main; then echo main; 
	elif git show-ref --verify --quiet refs/heads/master; then echo master; 
	else echo main; fi
}

# --- Setup & config -----------------------------------------------------------
gg_setup_identity() {
	# Usage: gg_setup_identity "Your Name" "you@example.com" [main|master]
	local name="$1" mail="$2" default_branch="${3:-main}"
	[ -z "$name" ] && echo "Name required" && return 2
	[ -z "$mail" ] && echo "Email required" && return 2
	git config --global user.name "$name"
	git config --global user.email "$mail"
	git config --global init.defaultBranch "$default_branch"
	git config --global pull.rebase false
	git config --global fetch.prune true
	git config --global push.default simple
	git config --global rerere.enabled true
}

gg_quick_init() {
	# Usage: gg_quick_init <remote_url>
	local remote="$1"; [ -z "$remote" ] && echo "Remote URL required" && return 2
	echo "Initialize repo, first commit, set origin -> $remote"
	_gg_confirm || return 1
	git init
	git add .
	git commit -m "Initial commit" || true
	local base; base="$(_gg_base_branch)"
	git branch -M "$base"
	git remote add origin "$remote" 2>/dev/null || git remote set-url origin "$remote"
	git push -u origin "$base"
}

gg_set_upstream() {
	# Usage: gg_set_upstream [branch]
	local br="${1:-$(git rev-parse --abbrev-ref HEAD)}"
	git push -u origin "$br"
}

gg_fix_author_last() {
	# Usage: gg_fix_author_last "New Name" "new@example.com"
	local name="$1" mail="$2"; [ -z "$name" ] && echo Name? && return 2; [ -z "$mail" ] && echo Email? && return 2
	GIT_AUTHOR_NAME="$name" GIT_AUTHOR_EMAIL="$mail" \
	GIT_COMMITTER_NAME="$name" GIT_COMMITTER_EMAIL="$mail" \
	git commit --amend --no-edit --reset-author
}

# --- Branching & sync ---------------------------------------------------------
gg_sync_with_base() {
	# Rebase current branch onto base (main/master)
	local base; base="$(_gg_base_branch)"
	git fetch origin
	git rebase "origin/$base"
}

gg_merge_base() {
	local base; base="$(_gg_base_branch)"
	git fetch origin
	git merge "origin/$base"
}

gg_clean_merged_branches() {
	# Delete local branches fully merged into base
	local base; base="$(_gg_base_branch)"
	git fetch --all --prune
	git branch --merged "$base" | grep -vE "\*|\b$base\b" | xargs -r git branch -d
}

gg_rename_branch() {
	# Usage: gg_rename_branch <old> <new>
	local old="$1" new="$2"; [ -z "$old" -o -z "$new" ] && echo "Need <old> <new>" && return 2
	git branch -m "$old" "$new"
	git push origin -u "$new"
	git push origin --delete "$old" || true
}

# --- Commits, undo, stash -----------------------------------------------------
gg_amend_msg() { # Usage: gg_amend_msg "New message"
	git commit --amend -m "$1"
}

gg_undo_last_keep() { # undo last commit, keep changes unstaged
	git reset --mixed HEAD~1
}

gg_undo_last_discard() { # DANGER: drop last commit and changes
	echo "This will discard changes."
	_gg_confirm || return 1
	git reset --hard HEAD~1
}

gg_squash_last() { # Usage: gg_squash_last <N> "message"
	local n="$1" msg="$2"; [ -z "$n" -o -z "$msg" ] && echo "Need <N> and \"message\"" && return 2
	_gg_confirm || return 1
	git reset --soft "HEAD~$n"
	git commit -m "$msg"
}

gg_stash() { # Usage: gg_stash [message]
	git stash push -u -m "${1:-wip}"
}

gg_stash_apply_last() {
	git stash apply stash@{0}
}

# --- Recovery -----------------------------------------------------------------
gg_reflog() {
	git reflog --date=relative | nl -ba | head -n 50
}

gg_restore_file() { # Usage: gg_restore_file <path> [commit]
	local p="$1" c="${2:-HEAD}"; [ -z "$p" ] && echo "Path required" && return 2
	git checkout "$c" -- "$p"
}

# --- Tags & releases ----------------------------------------------------------
gg_tag() { # Usage: gg_tag v1.0 "Message"
	local tag="$1" msg="$2"; [ -z "$tag" -o -z "$msg" ] && echo "Need tag and message" && return 2
	git tag -a "$tag" -m "$msg"
	git push origin "$tag"
}

gg_delete_tag() { # Usage: gg_delete_tag v1.0
	local tag="$1"; [ -z "$tag" ] && echo "Tag?" && return 2
	git tag -d "$tag" && git push origin :refs/tags/"$tag"
}

# --- Remotes ------------------------------------------------------------------
gg_set_remote_https() { # Usage: gg_set_remote_https user repo
	local u="$1" r="$2"; [ -z "$u" -o -z "$r" ] && echo "Need user repo" && return 2
	git remote set-url origin "https://github.com/$u/$r.git"
}

gg_set_remote_ssh() { # Usage: gg_set_remote_ssh user repo
	local u="$1" r="$2"; [ -z "$u" -o -z "$r" ] && echo "Need user repo" && return 2
	git remote set-url origin "git@github.com:$u/$r.git"
}

gg_prune() {
	git fetch --all --prune
}

# --- Submodules & LFS (optional) ---------------------------------------------
gg_submodules_init() {
	git submodule update --init --recursive
}

gg_lfs_setup() { # Track binary patterns with Git LFS
	git lfs install
	for pat in "$@"; do git lfs track "$pat"; done
	git add .gitattributes
	git commit -m "Track with Git LFS" || true
}

# --- GitHub CLI (if installed) -----------------------------------------------
if command -v gh >/dev/null 2>&1; then
	gg_pr_create() { # Usage: gg_pr_create [base]
		local base="${1:-$(_gg_base_branch)}"
		gh pr create --base "$base" --fill
	}
	gg_pr_view() { gh pr view --web; }
fi

# --- Help ---------------------------------------------------------------------
gg_help() {
	cat <<'EOF'
Git/GitHub toolkit (aliases + functions)

Aliases:
	g, gs, ga, gc, gca, gp, gpl, gpf, glog, gdiff

Common functions:
	gg_setup_identity "Name" "email" [main|master]
	gg_quick_init <remote_url>
	gg_set_upstream [branch]
	gg_fix_author_last "New Name" "new@mail"

Branching & sync:
	gg_sync_with_base      # rebase onto main/master
	gg_merge_base          # merge main/master into current
	gg_clean_merged_branches
	gg_rename_branch <old> <new>

Commits & undo:
	gg_amend_msg "New message"
	gg_undo_last_keep      # keep changes
	gg_undo_last_discard   # discard (confirm)
	gg_squash_last <N> "message"
	gg_stash [msg] | gg_stash_apply_last

Recovery & files:
	gg_reflog
	gg_restore_file <path> [commit]

Tags & remotes:
	gg_tag vX.Y "Message" | gg_delete_tag vX.Y
	gg_set_remote_https user repo | gg_set_remote_ssh user repo
	gg_prune

Extras:
	gg_submodules_init
	gg_lfs_setup <patterns>
	gh: gg_pr_create [base], gg_pr_view (if GitHub CLI installed)

Tip: Use glog to visualize history. Prefer gpf (force-with-lease) over --force.
EOF
}

# Print help when executed directly (not sourced)
if [ "${BASH_SOURCE:-$0}" = "$0" ]; then
	gg_help
fi

# End of file

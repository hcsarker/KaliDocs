## 🧩 Kali Linux Software Setup Guide

Fast, reliable setup for a fresh Kali Linux install: essentials, dev stacks, productivity tools, and useful references. All commands target Debian-based Kali.

---

### 1) Update the system

```bash
sudo apt update
sudo apt full-upgrade -y
sudo reboot
```

---

### 2) Essentials (CLI and utilities)

```bash
sudo apt install -y \
	build-essential curl wget git vim nano \
	unzip p7zip-full zip \
	htop tree neofetch \
	net-tools lsb-release ca-certificates gnupg
```

Optional: common networking/security tools (many come preinstalled on Kali):

```bash
sudo apt install -y nmap wireshark aircrack-ng john hashcat
```

---

### 3) Productivity CLI extras

```bash
sudo apt install -y fzf ripgrep bat eza zoxide trash-cli

# Enable zoxide + fzf (zsh)
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
echo 'source /usr/share/doc/fzf/examples/key-bindings.zsh 2>/dev/null || true' >> ~/.zshrc
echo 'source /usr/share/doc/fzf/examples/completion.zsh 2>/dev/null || true' >> ~/.zshrc
```

Tip: eza is a modern ls; bat is a prettier cat (may be installed as batcat).

---

### 4) Developer stacks

#### Python

```bash
sudo apt install -y python3 python3-pip python3-venv pipx
pipx ensurepath

# Create project venv
python3 -m venv ~/proj/.venv
source ~/proj/.venv/bin/activate
pip install --upgrade pip setuptools wheel
```

#### Node.js (via nvm)

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
```

#### Docker Engine (optional)

```bash
sudo apt install -y docker.io docker-compose-plugin
sudo usermod -aG docker "$USER"
newgrp docker <<'EOF'
docker --version
docker run --rm hello-world
EOF
```

#### Git config

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
```

---

### 5) Desktop apps (optional)

```bash
sudo apt install -y gparted vlc qbittorrent \
	gnome-tweaks gnome-shell-extensions
```

VS Code: follow official Microsoft repo steps, or use open-source VSCodium:

```bash
sudo apt install -y codium || true
```

---

### 6) Verify installation

```bash
git --version
python3 --version
pip --version
node --version && npm --version
docker --version || true
nmap --version
```

---

### 7) Troubleshooting

- Locked apt (another process using dpkg):

```bash
sudo rm -f /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock-frontend
sudo dpkg --configure -a
sudo apt -f install
```

- Broken packages or partial upgrades:

```bash
sudo apt --fix-broken install
sudo apt clean && sudo apt update
```

- Wireshark non-root capture: add user to group and re-login

```bash
sudo dpkg-reconfigure wireshark-common
sudo usermod -aG wireshark "$USER"
```

---

### 8) Related docs in this folder

- Packet Tracer install: [install_packettracer_kali.md](./install_packettracer_kali.md)
- XAMPP issues and fixes: [XAMPP_Install_Uninstall_Issues_Guide.md](./XAMPP_Install_Uninstall_Issues_Guide.md)

---

### 9) Clean up

```bash
sudo apt autoremove -y && sudo apt clean
```

That’s it. You’re ready to work. Pair this with your terminal aliases in `../terminal-shortcuts/` for an even smoother workflow.

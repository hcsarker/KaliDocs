#!/bin/bash

echo "========================================"
echo "🧼 KDE-only Desktop Cleanup Script"
echo "📦 Removing GNOME & XFCE safely"
echo "========================================"

echo "[1] Checking current desktop environment:"
echo "    You are using: $XDG_CURRENT_DESKTOP"
echo ""

echo "[2] Removing GNOME and XFCE (forcefully)..."
sudo apt purge --allow-remove-essential kali-desktop-gnome kali-desktop-xfce -y

echo ""
echo "[3] Cleaning up unused dependencies..."
sudo apt autoremove --purge -y

echo ""
echo "[4] Fixing broken installs (if any)..."
sudo apt --fix-broken install -y
sudo dpkg --configure -a

echo ""
echo "[5] Final update and upgrade..."
sudo apt update && sudo apt upgrade -y

echo ""
echo "✅ GNOME & XFCE removed. Only KDE is active now!"
echo "🔁 Reboot recommended: sudo reboot"

# KDE-only Desktop Cleanup for Kali Linux

This script will remove unnecessary desktop environments (GNOME and XFCE) if you are using KDE, to reduce system overhead and improve performance.

---

## 🧠 Why do this?

- Reduces background services
- Saves RAM and CPU
- Prevents overheating
- Makes the system cleaner and lighter

---

## ⚠️ Important

**This script uses `--allow-remove-essential`** to forcibly remove GNOME/XFCE.  
Only run this if you are sure KDE is your primary desktop environment.

---

## ✅ What it does

1. Verifies current desktop
2. Removes GNOME and XFCE
3. Runs `autoremove` and fix commands
4. Updates the system

---

## 🛠️ How to Use

```bash
chmod +x remove-gnome-xfce.sh
./remove-gnome-xfce.sh

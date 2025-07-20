
# 🔥 Kali Linux Overheating Troubleshooting Guide

This guide explains the most common reasons your Kali Linux system may overheat, along with solutions.

---

## ✅ 1. Excessive Background Services
Having multiple desktop environments like GNOME, KDE, XFCE can lead to unnecessary background services.

**Solution:**
```bash
sudo apt purge kali-desktop-gnome kali-desktop-xfce
sudo apt autoremove --purge
```

---

## ✅ 2. High CPU Usage
Some tools like `dotnet`, `gstreamer`, `medusa`, etc., may consume high CPU even when idle.

**Check:**
```bash
top
# or
htop  # Install with: sudo apt install htop
```

---

## ✅ 3. Graphics Driver Inefficiency
Default drivers may cause high GPU/CPU load, especially with NVIDIA.

**Solution for NVIDIA:**
```bash
sudo apt install nvidia-driver
sudo reboot
```

---

## ✅ 4. Missing Fan/Thermal Control
Laptops may lack thermal control software like `acpi`, `tlp`, `thermald`.

**Install:**
```bash
sudo apt install thermald tlp acpi
sudo systemctl enable --now thermald
sudo systemctl enable --now tlp
```

---

## ✅ 5. Kernel Conflicts
New kernel versions may lack proper thermal sensor detection.

**Check:**
```bash
uname -r
sensors
# Install: sudo apt install lm-sensors && sudo sensors-detect
```

---

## ✅ 6. Heavy Software Usage
Apps like Chrome, Brave, Firefox, VSCode running together increase CPU/GPU load.

---

## ✅ 7. Hidden Zombie/Malware Processes
Zombie or malicious processes can consume resources.

**Check:**
```bash
ps aux | sort -nk +3 | tail
```

---

## 🔧 Recommended Tools for Power & Thermal Management:
```bash
sudo apt install tlp thermald powertop lm-sensors
sudo sensors-detect
sudo powertop --auto-tune
```

---

## 📁 Path: ~/KaliDocs/SystemMonitoring/overheating.md

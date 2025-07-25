
# 📦 Cisco Packet Tracer 8.2.2 Installation on Kali Linux (KDE)

## 🧾 Description
Step-by-step guide to install Cisco Packet Tracer on Kali Linux, handling deprecated dependencies and setting up launcher for KDE Plasma users.

---

## ✅ Prerequisites

### 1. Download `.deb` package from Cisco Netacad:
> Make sure you're logged in at:  
> https://www.netacad.com/portal/resources/packet-tracer

Place the downloaded file (e.g., `Packet_Tracer822_amd64_signed.deb`) in `~/Downloads`.

---

## 🔧 Step-by-Step Installation

### 🛠 1. Remove Previous Broken Install (If Any)
```bash
sudo dpkg --remove packettracer
sudo rm -rf /opt/packettracer
```

---

### 📦 2. Install Required Dependencies
```bash
sudo apt update
sudo apt install -y libgl1 libxcb-xinerama0 dialog
```

> ❌ Do NOT use deprecated packages like `libgl1-mesa-glx` or `libxcb-xinerama0-dev`.

---

### 💥 3. Force Install Packet Tracer
```bash
cd ~/Downloads
sudo dpkg -i --ignore-depends=libgl1-mesa-glx,libxcb-xinerama0-dev Packet_Tracer822_amd64_signed.deb
```

---

### 🔁 4. Fix Dependency Issues
```bash
sudo apt --fix-broken install
```

---

### 🚀 5. Launch Packet Tracer
```bash
/opt/packettracer/packettracer
```

---

## 🧩 Optional: Add Menu Launcher for KDE

### Create `.desktop` Entry
```bash
sudo nano /usr/share/applications/packettracer.desktop
```

Paste the following content:

```ini
[Desktop Entry]
Name=Cisco Packet Tracer
Comment=Networking simulation tool
Exec=/opt/packettracer/packettracer
Icon=/opt/packettracer/art/app.png
Type=Application
Categories=Education;Network;
Terminal=false
```

### Make It Executable
```bash
sudo chmod +x /usr/share/applications/packettracer.desktop
```

Now you can find "Cisco Packet Tracer" from KDE Application Menu.

---

## ❗Troubleshooting

| Problem                        | Solution                                                                 |
|-------------------------------|--------------------------------------------------------------------------|
| `command not found`           | Use full path: `/opt/packettracer/packettracer`                          |
| GUI not launching             | Run in terminal to see errors                                           |
| Missing icon or menu entry    | Recheck `.desktop` file path and permissions                            |

---

## 📂 Folder Structure (After Install)
```
/opt/packettracer/
├── packettracer
├── art/
│   └── app.png
├── bin/
├── languages/
└── ...
```

---

## ✅ Tested On
- Kali Linux 2024.2 (KDE Plasma)
- Packet Tracer 8.2.2 (64-bit `.deb`)
- Kernel 6.12+

---

## 🧠 Author
Hridoy Chandra Sarker  
July 2025 – Kali Linux KDE

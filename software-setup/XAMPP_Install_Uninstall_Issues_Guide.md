
# 📦 XAMPP Installation, Uninstallation & Common Issues (Linux)

## 📥 Installation Guide

### Step 1: Download XAMPP Installer
Visit [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)  
Choose the Linux `.run` installer (e.g., `xampp-linux-x64-8.2.12-0-installer.run`)

### Step 2: Make Installer Executable
```bash
cd ~/Downloads
chmod +x xampp-linux-x64-8.2.12-0-installer.run
```

### Step 3: Run the Installer
```bash
sudo ./xampp-linux-x64-8.2.12-0-installer.run
```
Follow the GUI installer steps.

---

## 🚫 Common Issues

### ❗ phpMyAdmin Cannot Connect to MySQL
**Error:**
```
mysqli::real_connect(): (HY000/2002): No such file or directory
```

### 🔍 Reason:
- MySQL server is not running
- Wrong host or socket in `phpMyAdmin/config.inc.php`

### ✅ Fix:
1. Start XAMPP:
    ```bash
    sudo /opt/lampp/lampp start
    ```

2. If needed, stop system MySQL:
    ```bash
    sudo systemctl stop mysql
    ```

3. Update `phpMyAdmin` config:
    ```php
    $cfg['Servers'][1]['host'] = '127.0.0.1';
    $cfg['Servers'][1]['socket'] = '/opt/lampp/var/mysql/mysql.sock';
    ```

4. Restart XAMPP:
    ```bash
    sudo /opt/lampp/lampp restart
    ```

---

## 🧹 Uninstallation Guide

### Step 1: Stop All Services
```bash
sudo /opt/lampp/lampp stop
```

### Step 2: Run the Uninstaller (if available)
```bash
sudo /opt/lampp/uninstall
```

### Step 3: Manual Removal (if needed)
```bash
sudo rm -rf /opt/lampp
```

### Step 4: Clean Desktop or Symlinks
```bash
rm ~/.local/share/applications/xampp.desktop
sudo rm -f /usr/bin/xampp
```

---

## ✅ Status Check
Check XAMPP service status:
```bash
sudo /opt/lampp/lampp status
```

---

## 💬 Need Help?
If issues persist, check logs or reach out with error messages.

---


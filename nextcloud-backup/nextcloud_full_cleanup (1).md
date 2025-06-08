# 🧹 Full Nextcloud Cleanup (One File Guide) - Kali Linux

This single file includes **every step** needed to completely uninstall and clean up **Nextcloud** and all related components from your Kali Linux system.

---

## ✅ Step 1: Stop All Related Services

```bash
sudo systemctl stop apache2
sudo systemctl stop nginx
sudo systemctl stop mariadb
```

---

## 🧨 Step 2: Remove Nextcloud Web Files

```bash
sudo rm -rf /var/www/html/nextcloud
rm -rf ~/nextcloud
```

---

## 🧨 Step 3: Delete Database and User

Enter MariaDB shell:

```bash
sudo mysql -u root -p
```

Then run:

```sql
DROP DATABASE nextcloud;
DROP USER 'nextclouduser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

To check exact DB name and username (optional):

```bash
cat /var/www/html/nextcloud/config/config.php
```

---

## 🧨 Step 4: Uninstall Apache, PHP, MariaDB (Optional)

```bash
sudo apt purge apache2 mariadb-server php* libapache2-mod-php -y
sudo apt autoremove -y
sudo apt clean
```

---

## 🧨 Step 5: Remove Config Files for Apache/Nginx

```bash
sudo rm /etc/apache2/sites-available/nextcloud.conf
sudo rm /etc/apache2/sites-enabled/nextcloud.conf
sudo rm -rf /etc/apache2
sudo rm -rf /etc/nginx
```

---

## 🧨 Step 6: Remove Snap Package (If Used)

```bash
sudo snap remove nextcloud
sudo rm -rf /var/snap/nextcloud
```

---

## 🧨 Step 7: Clean Up Database Data and Logs

```bash
sudo rm -rf /var/log/nextcloud
sudo rm -rf /var/lib/mysql
sudo rm -rf /etc/mysql
```

---

## ✅ Step 8: Confirm No Servers Running

Check for any open server ports:

```bash
sudo ss -tuln
```

You should not see these ports:
- `:80` → Apache/Nginx
- `:443` → HTTPS
- `:3306` → MySQL/MariaDB

---

## ✅ Your System is Now Fully Clean of Nextcloud
This concludes the full manual removal of Nextcloud and its components from your system.---

## 🧹 Step 9: Remove Nextcloud Desktop Client (GUI)

### 🔍 Check if Installed:
```bash
which nextcloud
```

---

### 🧨 Uninstall the Desktop Client

If installed via APT:
```bash
sudo apt purge nextcloud-desktop -y
sudo apt autoremove -y
```

If installed via AppImage:
```bash
rm ~/Downloads/Nextcloud-*.AppImage  # Or wherever you stored it
```

---

### 🗂️ Remove User Sync Data & Configs

```bash
rm -rf ~/.config/Nextcloud
rm -rf ~/Nextcloud
rm -rf ~/.local/share/Nextcloud
rm -rf ~/.cache/Nextcloud
```

---

## ✅ Your system is now completely clean of:
- 🧾 Nextcloud Server (Web/DB)
- 🖥️ Nextcloud Desktop App
- ⚙️ All Configs, Caches, and Logs

🎉 You now have a clean Kali Linux system with no Nextcloud components.
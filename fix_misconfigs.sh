#!/bin/bash
echo \"Fixing common misconfigurations...\"

# 1. Fix world-writable cron
sudo chmod o-w /etc/cron.d
sudo chmod 644 /etc/cron.d/*

# 2. Restrict sudo NOPASSWD
sudo sed -i '/NOPASSWD/d' /etc/sudoers
echo \"%admins ALL=(ALL) ALL\" | sudo tee /etc/sudoers.d/admins
echo \"%dev ALL=(ALL) NOPASSWD:/usr/bin/systemctl restart project.service\" | sudo tee /etc/sudoers.d/dev

# 3. Secure /etc/shadow permissions
sudo chmod 600 /etc/shadow
sudo chown root:shadow /etc/shadow

echo \"All misconfigurations fixed and system hardened.\"

#!/bin/bash
# Create groups
sudo groupadd admins
sudo groupadd dev
sudo groupadd audit

# Create users
sudo useradd -m -s /bin/bash -G admins alice
sudo passwd alice
sudo useradd -m -s /bin/bash -G dev bob
sudo passwd bob
sudo useradd -m -s /bin/bash -G audit claire
sudo passwd claire

# Project folder setup
sudo mkdir -p /srv/project
sudo chown root:dev /srv/project
sudo chmod 2770 /srv/project
sudo setfacl -m g:audit:rx /srv/project
sudo setfacl -d -m g::rwx /srv/project
sudo setfacl -d -m o::--- /srv/project

# Install and enable auditd
sudo apt install auditd -y
sudo auditctl -w /etc/sudoers -p wa -k sudoers_changes
sudo auditctl -w /etc/passwd -p wa -k passwd_changes
sudo auditctl -w /etc/shadow -p wa -k shadow_changes

echo \"User creation and ACL setup complete.\"

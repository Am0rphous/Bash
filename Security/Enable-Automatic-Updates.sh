#!/bin/bash

#source: https://brainfood.xyz/post/20191116-setup-gitlab-runner-with-docker-in-docker/

# Install Unattended Upgrades package
sudo apt update
sudo apt install unattended-upgrades

# Configure Unattended Upgrades
cat << EOF | sudo tee /etc/apt/apt.conf.d/50unattended-upgrades
# Enable Upgrade for all package types
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESM:${distro_codename}";
        "${distro_id}:${distro_codename}-updates";
        "${distro_id}:${distro_codename}-proposed";
        "${distro_id}:${distro_codename}-backports";
};
Unattended-Upgrade::DevRelease "false";
# Cleanup
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
# Reboot during the night
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
EOF

# Enable Unattended Upgrades
cat << EOF | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOF

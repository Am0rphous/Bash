#!/bin/bash

#source and inspo: https://brainfood.xyz/post/20191116-setup-gitlab-runner-with-docker-in-docker/

# Install Unattended-Upgrades package
sudo apt update && sudo apt install unattended-upgrades

# Configure Unattended Upgrades
cat << EOF | sudo tee /etc/apt/apt.conf.d/50unattended-upgrades
// documentation: https://wiki.debian.org/UnattendedUpgrades
// Enable Upgrade for all package types
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESM:${distro_codename}";
        "${distro_id}ESM:${distro_codename}-infra-security";
        "${distro_id}:${distro_codename}-updates";
        "${distro_id}:${distro_codename}-proposed";
        "${distro_id}:${distro_codename}-backports";
};
Unattended-Upgrade::DevRelease "auto";
Unattended-Upgrade::AutoFixInterruptedDpkg "true";
Unattended-Upgrade::MinimalSteps "true";
Unattended-Upgrade::InstallOnShutdown "false";

// Cleanup
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
// Equivalent to apt-get autoremove
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Reboot during the night/morning
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "06:00";

// Enable verbose logging
Unattended-Upgrade::Verbose "true";

// Print debugging information both in unattended-upgrades and
// in unattended-upgrade-shutdown
Unattended-Upgrade::Debug "true";
EOF

# Enable Unattended Upgrades
cat << EOF | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
// Enable the update/upgrade script (0=disable)
APT::Periodic::Enable "1";
// Do "apt-get update" automatically every n-days (0=disable)
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
EOF

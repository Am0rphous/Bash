#!/bin/bash
#Github: Am0rphous
#Inspo: https://brainfood.xyz/post/20191116-setup-gitlab-runner-with-docker-in-docker/

# Install packages
sudo apt update && sudo apt install unattended-upgrades update-notifier-common

# Configuring
sudo dpkg-reconfigure unattended-upgrades

sudo cat <<'EOF' > /etc/apt/apt.conf.d/50unattended-upgrades
// documentation: https://wiki.debian.org/UnattendedUpgrades

// Automatically upgrade packages from these (origin:archive) pairs
//
// Note that in Ubuntu security updates may pull in new dependencies
// from non-security sources (e.g. chromium). By allowing the release
// pocket these get automatically pulled in.
// Enable Upgrade for all package types
Unattended-Upgrade::Allowed-Origins {
       "${distro_id}:${distro_codename}";
       "${distro_id}:${distro_codename}-security";
       // Extended Security Maintenance; doesn't necessarily exist for
       // every release and this system may not have it installed, but if
       // available, the policy for updates is such that unattended-upgrades
       // should also install from here by default.
       "${distro_id}ESMApps:${distro_codename}-apps-security";
       "${distro_id}ESM:${distro_codename}-infra-security";
       "${distro_id}:${distro_codename}-updates";
       "${distro_id}:${distro_codename}-proposed";
       "${distro_id}:${distro_codename}-backports";
};

Unattended-Upgrade::Package-Blacklist {
};

// This option controls whether the development release of Ubuntu will be
// upgraded automatically. Valid values are "true", "false", and "auto".
Unattended-Upgrade::DevRelease "auto";

// This option allows you to control if on a unclean dpkg exit
// unattended-upgrades will automatically run
//   dpkg --force-confold --configure -a
// The default is true, to ensure updates keep getting installed
Unattended-Upgrade::AutoFixInterruptedDpkg "true";

// Split the upgrade into the smallest possible chunks so that
// they can be interrupted with SIGTERM. This makes the upgrade
// a bit slower but it has the benefit that shutdown while a upgrade
// is running is possible (with a small delay)
Unattended-Upgrade::MinimalSteps "true";

// Install all updates when the machine is shutting down
// instead of doing it in the background while the machine is running.
// This will (obviously) make shutdown slower.
// Unattended-upgrades increases logind's InhibitDelayMaxSec to 30s.
// This allows more time for unattended-upgrades to shut down gracefully
// or even install a few packages in InstallOnShutdown mode, but is still a
// big step back from the 30 minutes allowed for InstallOnShutdown previously.
// Users enabling InstallOnShutdown mode are advised to increase
// InhibitDelayMaxSec even further, possibly to 30 minutes.
Unattended-Upgrade::InstallOnShutdown "false";

// Send email to this address for problems or packages upgrades
// If empty or unset then no email is sent, make sure that you
// have a working mail setup on your system. A package that provides
// 'mailx' must be installed. E.g. "user@example.com"
//Unattended-Upgrade::Mail "";

// Set this value to one of:
//    "always", "only-on-error" or "on-change"
// If this is not set, then any legacy MailOnlyOnError (boolean) value
// is used to chose between "only-on-error" and "on-change"
//Unattended-Upgrade::MailReport "on-change";

// Remove unused automatically installed kernel-related packages
// (kernel images, kernel headers and kernel version locked tools).
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";

// Do automatic removal of unused packages after the upgrade
// (equivalent to apt-get autoremove)
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Automatically reboot *WITHOUT CONFIRMATION* if
//  the file /var/run/reboot-required is found after the upgrade
Unattended-Upgrade::Automatic-Reboot "true";

// Automatically reboot even if there are users currently logged in
// when Unattended-Upgrade::Automatic-Reboot is set to true
Unattended-Upgrade::Automatic-Reboot-WithUsers "false";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately
//  Default: "now"
Unattended-Upgrade::Automatic-Reboot-Time "05:00";

// Use apt bandwidth limit feature, this example limits the download
// speed to 70kb/sec
//Acquire::http::Dl-Limit "70";

// Enable logging to syslog. Default is False
// Unattended-Upgrade::SyslogEnable "false";

// Specify syslog facility. Default is daemon
// Unattended-Upgrade::SyslogFacility "daemon";

// Download and install upgrades only on AC power
// (i.e. skip or gracefully stop updates on battery)
// Unattended-Upgrade::OnlyOnACPower "true";

// Download and install upgrades only on non-metered connection
// (i.e. skip or gracefully stop updates on a metered connection)
// Unattended-Upgrade::Skip-Updates-On-Metered-Connections "true";

// Verbose logging
Unattended-Upgrade::Verbose "true";

// Print debugging information both in unattended-upgrades and
// in unattended-upgrade-shutdown
Unattended-Upgrade::Debug "true";

// Allow package downgrade if Pin-Priority exceeds 1000
// Unattended-Upgrade::Allow-downgrade "false";
EOF



#enable Unattended Upgrades
sudo cat <<'EOF' > /etc/apt/apt.conf.d/20auto-upgrades
// Enable the update/upgrade script (0=disable)
APT::Periodic::Enable "1";

// Do "apt-get update" automatically every n-days (0=disable)
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
EOF

sudo service unattended-upgrades restart

printf "\nFollowing content is in the file '/etc/apt/apt.conf.d/20auto-upgrades': \n\n" && cat /etc/apt/apt.conf.d/20auto-upgrades
printf "\nI am done..\n"

echo ""
read -p "Do you want to test the configuration? y/n " anwser
if [ "$anwser" = y ]
then
  sudo unattended-upgrade -d -v
fi


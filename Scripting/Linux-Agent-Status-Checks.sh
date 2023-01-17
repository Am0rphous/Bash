#!/bin/bash

## This is not my script. I've downloaded it from somewhere but i do not remember from where.. 
## The intention was to reuse functions and/or use the script as a template for a system that 
## performs some sort of status checks. Let me know if this is your script, and I will be happy
## to credit you. :-)

# Set environment
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

GATEWAY=$(cat /opt/terrahost/gateway)
SERVERKEY=$(cat /opt/terrahost/serverkey)

function encode() {
        echo "$1" | base64
}

function getOS() {
        if [ -f /etc/lsb-release ]; then
                os_name=$(lsb_release -s -d)
        elif [ -f /etc/debian_version ]; then
                os_name="Debian $(cat /etc/debian_version)"
        elif [ -f /etc/redhat-release ]; then
                os_name=`cat /etc/redhat-release`
        else
                os_name="$(cat /etc/*release | grep '^PRETTY_NAME=\|^NAME=\|^DISTRIB_ID=' | awk -F\= '{print $2}' | tr -d '"' | tac)"
                if [ -z "$os_name" ]; then
                        os_name="$(uname -s)"
                fi
        fi
        echo "$os_name"
}

function cpuSpeed() {
        cpu_speed=$(cat /proc/cpuinfo | grep 'cpu MHz' | awk -F\: '{print $2}' | uniq)
        if [ -z "$cpu_speed" ]; then
                cpu_speed=$(lscpu | grep 'CPU MHz' | awk -F\: '{print $2}' | sed -e 's/^ *//g' -e 's/ *$//g')
        fi
        echo "$cpu_speed"
}

function defaultInterface() {
        interface="$(ip route get 4.2.2.1 | grep dev | awk -F'dev' '{print $2}' | awk '{print $1}')"
        if [ -z $interface ]; then
                interface="$(ip link show | grep 'eth[0-9]' | awk '{print $2}' | tr -d ':' | head -n1)"
        fi
        echo "$interface"
}

function activeConnections() {
        if [ -n "$(command -v ss)" ]; then
                active_connections="$(ss -tun | tail -n +2 | wc -l)"
        else
                active_connections="$(netstat -tun | tail -n +3 | wc -l)"
        fi
        echo "$active_connections"
}

function pingLatency() {
        ping_google="$(ping -B -w 2 -n -c 2 google.com | grep rtt | awk -F '/' '{print $5}')"
        echo "$ping_google"
}
agent_version="1.0"
serverkey=$(cat /opt/terrahost/serverkey)
gateway=$(cat /opt/terrahost/gateway)
hostname=$(hostname)
kernel=$(uname -r)
time=$(date +%s)
os=$(getOS)
os_arch=`uname -m`","`uname -p`
cpu_model=$(cat /proc/cpuinfo | grep 'model name' | awk -F\: '{print $2}' | uniq)
cpu_cores=$(cat /proc/cpuinfo | grep processor | wc -l)
cpu_speed=$(cpuSpeed)
cpu_load=$(cat /proc/loadavg | awk '{print $1","$2","$3}')
cpu_info=$(grep -i cpu /proc/stat | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$9","$10","$11";"}' | tr -d '\n')
sleep 1s
cpu_info_current=$(grep -i cpu /proc/stat | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$9","$10","$11";"}' | tr -d '\n')
disks=$(df -P -T -B 1k | grep '^/' | awk '{print $1","$2","$3","$4","$5","$6","$7";"}' | tr -d '\n')
disks_inodes=$(df -P -i | grep '^/' | awk '{print $1","$2","$3","$4","$5","$6";"}' | tr -d '\n')
file_descriptors=$(cat /proc/sys/fs/file-nr | awk '{print $1","$2","$3}')
ram_total=$(free | grep ^Mem: | awk '{print $2}')
ram_free=$(free | grep ^Mem: | awk '{print $4}')
ram_caches=$(free | grep ^Mem: | awk '{print $6}')
ram_buffers=0
ram_usage=$(free | grep ^Mem: | awk '{print $3}')
swap_total=$(cat /proc/meminfo | grep ^SwapTotal: | awk '{print $2}')
swap_free=$(cat /proc/meminfo | grep ^SwapFree: | awk '{print $2}')
swap_usage=$(($swap_total-$swap_free))
default_interface=$(defaultInterface)
all_interfaces=$(tail -n +3 /proc/net/dev | tr ":" " " | awk '{print $1","$2","$10","$3","$11";"}' | tr -d ':' | tr -d '\n')
sleep 1s
all_interfaces_current=$(tail -n +3 /proc/net/dev | tr ":" " " | awk '{print $1","$2","$10","$3","$11";"}' | tr -d ':' | tr -d '\n')
ipv4_addresses=$(ip -f inet -o addr show | awk '{split($4,a,"/"); print $2","a[1]";"}' | tr -d '\n')
ipv6_addresses=$(ip -f inet6 -o addr show | awk '{split($4,a,"/"); print $2","a[1]";"}' | tr -d '\n')
active_connections=$(activeConnections)
ping_latency=$(pingLatency)
ssh_sessions=$(who | wc -l)
uptime=$(cat /proc/uptime | awk '{print $1}')
processes=$(ps -e -o pid,ppid,rss,vsz,uname,pmem,pcpu,comm,cmd --sort=-pcpu,-pmem | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$9";"}' | tr -d '\n')

generate_post_data() {
        cat <<EOF
        {
                "agent_version": "$agent_version",
                "serverkey": "$serverkey",
                "gateway": "$gateway",
                "hostname": "$hostname",
                "kernel": "$kernel",
                "time": "$time",
                "os": "$os",
                "os_arch": "$os_arch",
                "cpu_model": "$cpu_model",
                "cpu_cores": "$cpu_cores",
                "cpu_speed": "$cpu_speed",
                "cpu_load": "$cpu_load",
                "cpu_info": "$cpu_info",
                "cpu_info_current": "$cpu_info_current",
                "disks": "$disks",
                "disks_inodes": "$disks_inodes",
                "file_descriptors": "$file_descriptors",
                "ram_total": "$ram_total",
                "ram_free": "$ram_free",
                "ram_caches": "$ram_caches",
                "ram_buffers": "$ram_buffers",
                "ram_usage": "$ram_usage",
                "swap_total": "$swap_total",
                "swap_free": "$swap_free",
                "swap_usage": "$swap_usage",
                "default_interface": "$default_interface",
                "all_interfaces": "$all_interfaces",
                "all_interfaces_current": "$all_interfaces_current",
                "ipv4_addresses": "$ipv4_addresses",
                "ipv6_addresses": "$ipv6_addresses",
                "active_connections": "$active_connections",
                "ping_latency": "$ping_latency",
                "ssh_sessions": "$ssh_sessions",
                "uptime": "$uptime",
                "processes": "$processes"
        }
EOF
}

curl -s -o /dev/null -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "$(generate_post_data)" "$GATEWAY"


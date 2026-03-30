#!/bin/bash

# Treg, bruker 1 sek per IP. Tar ca 4 minutter
for a in {1..254}; do ip=10.0.1.$a; ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip" UP; wait; done

# Heller: Scanner 254 hosts på noen sekunder. 8 b/packet = 8b x 254 = 2032b = 2kb. +Respons tot 4kb per /24 subnett. 3 subnett = 12 kb
seq 1 254 | xargs -P200 -I% bash -c 'ip=10.0.1.%;   ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip UP"'
seq 1 254 | xargs -P200 -n1 bash -c 'ip=10.0.1.$0;  ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip UP"'
seq 1 254 | xargs -P200 -I{} bash -c 'ip=10.0.1.{}; ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip UP"'

# Alternativ med 'parallel'. apt install parallel
seq 1 254 | parallel -j200 'ip=10.0.1.{}; ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip UP"'

# Flere subnett
printf "%s\n" {10.0.1.,10.0.2.}{1..254} | xargs -P256 -I{} bash -c 'ip={}; ping -W1 -4 -s0 -c1 "$ip" >/dev/null 2>&1 && echo "$ip UP"'

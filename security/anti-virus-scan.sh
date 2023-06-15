#!/bin/bash

command=(
clamscan /
  --infected                            # Only print infected files
  --log=clamscan.log
  --log=$(date +'%d/%m/%Y-%H:%M:%S'-clamscan.log)       # Save scan report to FILE
  --recursive=yes                       # Scan subdirectories recursively
  --allmatch=yes                        # Continue scanning within file after finding a match
  --cross-fs=yes                        # Scan files and directories on other filesystems
  --follow-dir-symlinks=2               # Follow directory symlinks (0 = never, 1 = direct, 2 = always)
  --follow-file-symlinks=2              # Follow file symlinks (0 = never, 1 = direct, 2 = always)
  --copy=/tmp/clamscan-infected-files  # Copy infected files into DIRECTORY
  --detect-pua=yes                      # Detect Possibly Unwanted Applications
  --scan-mail=yes                       # Scan mail files
  --heuristic-alerts=yes                # Heuristic alerts
  --heuristic-scan-precedence=yes       # Stop scanning as soon as a heuristic match is found
  --scan-pe=yes                         # Scan PE files
  --scan-elf=yes                        # Scan ELF files
  --scan-ole2=yes                       # Scan OLE2 containers
  --scan-pdf=yes                        # Scan PDF files
  --scan-swf=yes                        # Scan SWF files
  --scan-html=yes                       # Scan HTML files
  --scan-xmldocs=yes                    # Scan xml-based document files
  --scan-hwp3=yes                       # Scan HWP3 files
  --scan-archive=yes                    # Scan archive files (supported by libclamav)
  --alert-broken=yes                    # Alert on broken executable files (PE & ELF)
  --alert-encrypted=yes                 # Alert on encrypted archives and documents
  --alert-encrypted-archive=yes         # Alert on encrypted archives
  --alert-encrypted-doc=yes             # Alert on encrypted documents
  --alert-macros=yes                    # Alert on OLE2 files containing VBA macros
)
echo "${command[@]}"   #prints the array above as a big one-line command :D
echo ""

"${command[@]}"        #this actually executes the command :J

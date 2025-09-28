#!/bin/bash

#If syslog is 6GB then strip it for the first characters and then sort it
#to view what log entries are most frequent. 

set -euo pipefail

user="mike"

infile="${1:-}"
outfile="/home/$user/syslog_stripped.txt"
counts_out="/home/$user/syslog_counts.txt"

if [[ -z "$infile" || ! -r "$infile" ]]; then
  echo "Usage: $0 /path/to/syslog" >&2
  exit 2
fi

#forces system to use default locale. Useful for consistent 
#behavior across commands, especially for sorting.
export LC_ALL=C

awk '{
  if ($1 ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}/) {
    $1=""; $2="";
    sub(/^[[:space:]]+/,"")
  }
  print
}' "$infile" > "$outfile"

sort "$outfile" uniq -c | sort -nr > "$counts_out"

echo "Stripped file: $outfile"
echo "Counts file:   $counts_out"

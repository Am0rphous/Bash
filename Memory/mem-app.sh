#!/bin/bash

#Source: https://www.zyxware.com/articles/4446/show-total-memory-usage-by-each-application-in-your-ubuntu-or-any-gnu-linux-system

ps -A --sort -rss -o comm,pmem,rss | awk '
  NR == 1 { print; next }
  { a[$1] += $2; b[$1] += $3; }
  END {
    for (i in a) {
      size_in_bytes = b[i] * 1024
      split("B KB MB GB TB PB", unit)
      human_readable = 0
      if (size_in_bytes == 0) {
        human_readable = 0
        j = 0
      }
      else {
        for (j = 5; human_readable < 1; j--)
          human_readable = size_in_bytes / (2^(10*j))
      }
      printf "%-20s\t%s\t%.2f%s\t%s\n", i, a[i], human_readable, unit[j+2], b[i]
    }
  }
' | awk 'NR>1' | sort -rnk4 | awk '
  BEGIN {printf "%-20s\t%%MEM\tSIZE\n", "COMMAND"} 
  {
    printf "%-20s\t%s\t%s\n", $1, $2, $3
  }
' | less

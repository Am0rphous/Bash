#/bin/bash
#source: https://unix.stackexchange.com/questions/444998/how-to-set-and-understand-fs-notify-max-user-watches

find /proc/*/fd -lname anon_inode:inotify |
   cut -d/ -f3 |
   xargs -I '{}' -- ps --no-headers -o '%p %U %c' -p '{}' |
   uniq -c |
   sort -nr

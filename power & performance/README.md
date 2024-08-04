# Power & Performance

### Change process priority
- `nice` command = change process priority for a **new** process
  - Value between `-20` (HIGH priority) as kernel processes and `+19` equals less priority.
  - Higher priority needs `sudo` and less priority doesn't
````
sudo nice -15 ./myprogram        #sets nice value as MINUS 15 for "myprogram"
sudo nice -20 ./myprogram        #sets MAX priority for "myprogram"
nice +19 ./myprogram             #sets LOW priority on "myprogram"
````
- `renice` command = change process priority for an **already running** process
````
renice -n +5 -p 1234       #n=nice value which is +5 for the pid "1234"
renice -n -20 -p 1234      #n=nice is -20 for the pid "1234"

#Example: renice the default tor process
pid=$(ps aux | grep tor-service-defaults-torrc | grep -v grep | awk '{print $2}')
renice -n -19 -p $pid
````

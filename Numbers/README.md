# Numbers
````shell
seq 1 10                                            # generate numbers 1..10
seq 1 2 10                                          # generate 1,3,5,7,9 (step 2)
seq -w 1 10                                         # zero-padded numbers 01..10
seq 0 0.5 4.5                                       # floating sequence 0.0,0.5,...,4.5
seq -s, 1 10                                        # comma-separated on one line
seq -s" " 1 10                                      # space-separated on one line
yes 0 | head -n 10                                  # print 0 ten times
printf "%s\n" {1..10}                               # print 1..10 (brace expansion)
x=$((5 + 3)); echo $x                               # integer arithmetic, prints 8
i=0; i=$((i+1)); echo $i                            # increment variable, prints 1
echo $((12 * 3))                                    # multiplication, prints 36
echo $((35 / 6))                                    # integer division, prints 5
echo $((17 % 5))                                    # modulo, prints 2
echo "scale=4; 1.5 * 3.2" | bc                      # floating calc, prints 4.8000
echo "scale=6; 1/3" | bc -l                         # division with precision
seq 0 0.1 1                                         # float loop 0.0..1.0 (use instead of python)
seq 1 10 | paste -sd+ - | bc                        # sum 1..10 using bc
seq 1 10 | awk '{s+=$1} END{print s}'               # sum using awk
seq 1 6 | awk 'BEGIN{p=1} {p*=$1} END{print p}'     # product 1*2*...*6
seq 1 10 | wc -l                                    # count numbers/lines
seq 1 10 | awk '{s+=$1; n++} END{print s/n}'        # average (mean)
seq 1 10 | awk 'NR==1{min=max=$1} {if($1<min)min=$1; if($1>max)max=$1} END{print "min="min,"max="max"}'    # min/max
seq 1 30 | awk 'NR%3==1'                            # select every 3rd number (1,4,7,...)
seq 1 20 | awk '$1>10'                              # select numbers greater than 10
seq 1 20 | sed -n '5,10p'                           # slice lines 5..10
shuf -i 1-100 -n 1                                  # random integer in 1..100
shuf -i 1-100 -n 5                                  # 5 unique random numbers from 1..100
printf "%03d\n" {1..10}                             # pad to width 3 (001..010)
printf "%.2f\n" 3.14159                             # format float with 2 decimals
a=5; b=10; if [ "$a" -lt "$b" ]; then echo "a<b"; fi     # integer compare with [ ]
a=5; b=10; if (( a < b )); then echo "a<b"; fi           # integer compare with (( ))
seq 1 10                                            # simple sequence 1..10
seq 1 10 | awk '{print $1*2}'                       # multiply each by 2 (map)
seq 1 10 | awk '{v=$1*2} v%2==0{print v}'           # filter even results after mapping
seq 1 10 | awk '{v=$1*2} v%2==0{sum+=v} END{print sum}'    # sum of mapped even results
awk 'BEGIN{N=100; for(i=2;i<=N;i++) a[i]=1; for(p=2;p*p<=N;p++) if(a[p]) for(q=p*p;q<=N;q+=p) a[q]=0; for(i=2;i<=N;i++) if(a[i]) print i}'    # primes up to 100
seq 1 10 | awk '{s+=$1; print s}'                   # cumulative sum (running total)
seq 1 10 | sort | uniq -c                           # histogram / counts of numbers
awk 'BEGIN{srand(); print rand()}'                  # random float between 0 and 1
seq 1 10 | shuf -n1                                 # random element from list 1..10
seq 1 100 | shuf | head -n 10 | sort -n             # shuffle 1..100, take 10, sort them
seq 1 10 | awk 'BEGIN{print "index,value"} {print $1","$1*$1}'     # CSV index,value where value=index^2
seq 1 10 | awk 'BEGIN{p=1} {p*=$1} END{print p}'                    # factorial of 10 (10!)

````

### Comprehensive list, gotta sort and clean it later
````shell
seq 1 10                                            # generate numbers 1..10
seq 1 2 10                                          # generate 1,3,5,7,9 (step 2)
seq -w 1 10                                         # zero-padded numbers 01..10
seq 0 0.5 4.5                                       # floating sequence 0.0,0.5,...,4.5
seq -s, 1 10                                        # comma-separated on one line
seq -s" " 1 10                                      # space-separated on one line
seq -f "%03.2f" 0 0.25 2                            # format sequence with printf-style in seq
seq 0 0.1 1                                         # float loop 0.0..1.0
seq -f "%g" 0 0.25 2                                # alternative seq float formatting
yes 0 | head -n 10                                  # print 0 ten times
printf "%s\n" {1..10}                               # print 1..10 (brace expansion)
printf "%03d\n" {1..10}                             # pad to width 3 (001..010)
printf "%.2f\n" 3.14159                             # format float with 2 decimals
printf "%'d\n" 1234567890                           # format with thousands separator (locale-aware)
x=$((5 + 3)); echo $x                               # integer arithmetic, prints 8
i=0; i=$((i+1)); echo $i                            # increment variable, prints 1
a=5; b=10; if [ "$a" -lt "$b" ]; then echo "a<b"; fi     # integer compare with [ ]
a=5; b=10; if (( a < b )); then echo "a<b"; fi           # integer compare with (( ))
echo $((12 * 3))                                    # multiplication, prints 36
echo $((35 / 6))                                    # integer division, prints 5
echo $((17 % 5))                                    # modulo, prints 2
let "y = 2 * 3" ; echo $y                            # arithmetic with let
declare -i z=7; z+=3; echo $z                        # integer variable via declare -i
expr 5 + 3                                          # arithmetic with expr (POSIX)
bc <<< "scale=4; 1.5 * 3.2"                         # floating calc with bc (here-string)
echo "scale=6; 1/3" | bc -l                         # division with precision
bc -l <<< "scale=10; sqrt(2)"                       # square root with bc
bc <<< "define fact(n){ if(n<=1) return 1; return n*fact(n-1);} fact(10)"   # factorial with bc (recursive)
awk 'BEGIN{print 2.5*3.2}'                          # quick float math with awk
awk 'BEGIN{srand(); print rand()}'                  # random float between 0 and 1
awk 'BEGIN{srand(); for(i=1;i<=10;i++) print int(rand()*100)}'   # 10 random ints 0..99 via awk
RANDOM                                              # builtin bash random variable (0..32767)
echo $((RANDOM % 100 + 1))                          # random int 1..100 using $RANDOM
shuf -i 1-100 -n 1                                  # random integer in 1..100 (shuf)
shuf -i 1-100 -n 5                                  # 5 unique random numbers from 1..100
seq 1 10 | shuf -n1                                 # random element from list 1..10
jot - 1 10                                         # (BSD) generate numbers 1..10 (alternative to seq)
factor 123456                                      # factorization of integer (Debian/Ubuntu)
primesieve 100                                     # fast primes (if installed)
awk 'BEGIN{N=100; for(i=2;i<=N;i++) a[i]=1; for(p=2;p*p<=N;p++) if(a[p]) for(q=p*p;q<=N;q+=p) a[q]=0; for(i=2;i<=N;i++) if(a[i]) print i}'    # primes up to 100 (awk sieve)
paste -sd+ - | bc                                   # sum from piped list (use with seq)
seq 1 10 | awk '{s+=$1} END{print s}'               # sum using awk
seq 1 6 | awk 'BEGIN{p=1} {p*=$1} END{print p}'     # product 1*2*...*6
seq 1 10 | wc -l                                    # count numbers/lines
seq 1 10 | awk '{s+=$1; n++} END{print s/n}'        # average (mean)
seq 1 10 | awk 'NR==1{min=max=$1} {if($1<min)min=$1; if($1>max)max=$1} END{print "min="min,"max="max"}'    # min/max
seq 1 10 | awk '{s+=$1; print s}'                   # cumulative sum (running total)
seq 1 10 | sort | uniq -c                           # histogram / counts of numbers
awk '{print NR, $0}'                                # prefix lines with line number (useful for indexed lists)
nl -ba filename                                     # number all lines of a file (nl)
sed -n '5,10p'                                      # slice lines 5..10 (select a numeric range)
seq 1 30 | awk 'NR%3==1'                            # select every 3rd number (1,4,7,...)
seq 1 20 | awk '$1>10'                              # select numbers greater than 10
awk '$1 ~ /^[0-9]+$/{print}' file                    # print only numeric lines from file
awk 'BEGIN{for(i=0;i<=10;i++) print i, sin(i)}'     # trig with awk (uses radians)
awk 'BEGIN{for(i=1;i<=10;i++) print i, sqrt(i)}'    # index and sqrt
seq 1 100 | awk '{print NR, $1, log($1)}'           # index, value, ln(value)
python - <<'PY'                                     # use Python for precise float loops (example)
for i in [x*0.1 for x in range(0,11)]: print(f"{i:.1f}")
PY
python - <<'PY'                                      # big integer factorial with Python (exact)
import math
print(math.factorial(100))
PY
perl -e 'print join("\n", map { $_ * $_ } 1..10), "\n"'   # quick sequence of squares (Perl)
perl -e 'use bignum; $n=1; for(1..50){$n*=$_}; print $n,"\n"'   # big integer factorial with Perl bignum
seq 1 100 | awk '{print $1, $1*$1}'                  # index and square
seq 1 100 | awk '{print $1, $1*$1,$1*$1*$1}'         # index, square, cube
seq 1 100 | awk 'BEGIN{print "index,value"} {print $1","$1*$1}'   # CSV index,value where value=index^2
seq 1 10 | awk '{v=$1*2} v%2==0{print v}'           # filter even results after mapping
seq 1 10 | awk '{v=$1*2} v%2==0{sum+=v} END{print sum}'    # sum of mapped even results
seq 1 10 | awk 'BEGIN{p=1} {p*=$1} END{print p}'      # factorial of 10 (10!)
seq 1 100 | awk 'NR<=10{print NR,$1}'                 # top 10 with index
seq 1 100 | awk '{if($1%2==0) print $1}'              # print even numbers
seq 1 100 | awk '{if($1%2) print $1}'                 # print odd numbers
seq 1 100 | awk '{print $1, ($1%10)}'                 # value and remainder mod 10
seq 1 100 | awk '{print $1, sprintf("%06d",$1)}'      # value and zero-padded form
seq 1 100 | awk '{a[$1%10]++} END{for(i=0;i<10;i++) print i, a[i]}'   # bucket counts by mod 10
seq 1 1000 | paste - - - - | awk '{print $1+$2+$3+$4}'   # sum every 4 numbers (batch processing)
split -l 1000 bigfile part_                              # split file into 1000-line chunks (useful when lines are numeric)
xargs -n1 -I{} bash -c 'echo $(({} * {}))' < numbers.txt  # map each number to its square via xargs
while read -r n; do echo $((n*2)); done < numbers.txt     # read numbers and double each (loop)
awk 'BEGIN{FS=","} {print $1+0}' file.csv                 # coerce first CSV field to number and print
awk '{printf "%d %f\n", NR, $1}' numbers.txt              # combine index and numeric value in format
date +%s                                                  # current epoch seconds (numeric timestamp)
time sleep 1                                              # measure elapsed time (numeric seconds)
stat -c %s filename                                        # file size in bytes (numeric)
wc -c < filename                                           # file byte count (numeric)
sed -n '1p' file | od -An -t u4                            # numeric byte value of first 4 bytes
hexdump -n4 -e '1/4 "%u\n"' /dev/urandom                  # random unsigned int from /dev/urandom
openssl rand -hex 4 | xxd -r -p | od -An -t u4            # generate random unsigned integer from openssl entropy
cut -d, -f2 file.csv | awk '{s+=$1} END{print s}'          # sum second CSV column
awk 'BEGIN{print int(3.7), sprintf("%d", 3.7)}'           # integer cast/truncation examples
sed -E 's/[^0-9.\-]+/ /g' file | tr -s ' ' '\n' | awk 'NF'    # extract numbers to one per line
awk '{gsub(/[^0-9.-]/,""); if($0!="") print $0}' file        # extract numeric tokens from mixed text lines
numfmt --to=iec 12345678                                   # format numbers to human-readable (GNU coreutils)
numfmt --to=si 123456789                                    # format large numbers with SI units
numfmt --from=iec 12K                                       # parse human-readable to plain number
seq 1 100 | tr '\n' ' ' | sed 's/ $/\n/'                   # print numbers on single line separated by spaces
paste <(seq 1 10) <(seq 11 20)                             # paste two numeric columns side by side
column -t <(paste <(seq 1 10) <(seq 11 20))                # nicely aligned two-column numbers
comm -12 <(seq 1 10) <(seq 5 15)                           # intersection of numeric ranges (process substitution)
comm -3 <(seq 1 20) <(seq 10 30)                           # symmetric difference between ranges
join <(seq 1 20 | awk '{print $1, $1*$1}') <(seq 1 20 | awk '{print $1, $1*$1*$1}') -a1 -o '0,1.2,2.2'   # join numeric streams by index (advanced)
awk 'NR==FNR{a[$1]=$2; next} {print $1, a[$1]}' file1 file2   # join two numeric files by first column (awk join)
column -t numbers.txt                                      # align numeric columns in a file
sort -n numbers.txt | uniq -c | sort -nr                  # frequency sorted numeric histogram
awk 'BEGIN{for(i=1;i<=10;i++) print i, sin(i)}'           # trig example with awk
awk 'BEGIN{for(i=1;i<=10;i++) print i, sqrt(i)}'          # sqrt example with awk
awk 'BEGIN{srand(); for(i=1;i<=10;i++) print int(rand()*100)}'   # random ints via awk
seq 1 100 | awk '{print $1, $1*$1,$1*$1*$1}'               # index, square, cube
seq 1 100 | awk 'NR<=10{print NR,$1}'                      # top 10 with index
seq 1 100 | awk '{if($1%2==0) print $1}'                   # print even numbers
seq 1 100 | awk '{if($1%2) print $1}'                      # print odd numbers
seq 1 100 | awk '{print $1, ($1%10)}'                      # value and remainder mod 10
seq 1 100 | awk '{print $1, sprintf("%06d",$1)}'           # value and zero-padded form
seq 1 100 | awk '{a[$1%10]++} END{for(i=0;i<10;i++) print i, a[i]}'   # bucket counts by mod 10
seq 1 1000 | paste - - - - | awk '{print $1+$2+$3+$4}'     # sum every 4 numbers (batch processing)
awk 'BEGIN{N=200000; for(i=1;i<=N;i++) a[i]=i; s=0; for(i=1;i<=N;i++) s+=a[i]; print s}'   # stress test numeric loop in awk
rsync --progress --stats src dst                          # shows numeric transfer stats in CLI
du -sh *                                                  # show disk usage sizes (human readable numbers)
df -h                                                     # filesystem usage with numbers
watch -n1 'uptime | awk "{print \$3, \$4}"'                # periodically show numeric load averages (example)
numfmt --to=iec 12345678                                   # format numbers to human-readable (GNU coreutils)
printf "%d\n" 0xFF                                         # parse hex to decimal
bc <<< "obase=16; 255"                                     # decimal to hex (with bc)
bc <<< "ibase=16; FF"                                      # hex to decimal via bc
expr substr "12345" 2 3                                   # string slice returning numeric substring "234"
awk 'BEGIN{print int(3.7), sprintf("%d", 3.7)}'           # integer cast/truncation examples
cut -d, -f2 file.csv | awk '{s+=$1} END{print s}'          # sum second CSV column
awk '{print $1*0.001 " kB"}' sizes.txt                     # convert bytes to kB
sed -n '1,1p' file                                          # print first line (useful with numeric checks)
hexdump -n4 -e '1/4 "%u\n"' /dev/urandom                  # random unsigned int from /dev/urandom
openssl rand -hex 4 | xxd -r -p | od -An -t u4            # generate random unsigned integer from openssl entropy
stat -c %s filename                                        # file size in bytes (numeric)
wc -c < filename                                           # file byte count (numeric)
sed -n '1p' file | od -An -t u4                            # numeric byte value of first 4 bytes
numfmt --from=iec 12K                                      # parse human-readable to plain number
awk '{gsub(/[^0-9.-]/,""); if($0!="") print $0}' file      # extract numeric tokens from mixed text lines
sed -E 's/[^0-9.\-]+/ /g' file | tr -s ' ' '\n' | awk 'NF' # extract numbers to one per line
split -l 1000 bigfile part_                                # split file into 1000-line chunks
xargs -n1 -I{} bash -c 'echo $(({} * {}))' < numbers.txt   # map each number to its square via xargs
while read -r n; do echo $((n*2)); done < numbers.txt     # read numbers and double each (loop)
awk 'BEGIN{FS=","} {s+=$2; count++} END{print s/count}' file.csv   # mean of second CSV column
awk 'BEGIN{print int(3.7), sprintf("%d", 3.7)}'           # integer cast/truncation
python -c 'import statistics as s; print(s.pstdev(range(1,11)))'   # population stddev using Python
Rscript -e 'x<-1:10; cat(sd(x),"\n")'                      # sample stddev via R (if installed)
awk 'BEGIN{for(i=1;i<=10;i++) print i, sin(i)}'           # trig example (duplicate removed if repeated)

````

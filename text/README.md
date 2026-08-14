# Text


Generate log in banner with [figlet](https://www.figlet.org/)
  ```shell
  sudo apt install figlet
  figlet Welcome
  ```
Using icons/symbols
  - https://www.w3schools.com/charsets/ref_utf_dingbats.asp
  ```shell
  printf ☠ | hexdump    #Which outputs:
  0000000 98e2 00a0     #We want the last bit
  0000003
  
  printf ‘\xE2\x98\xA0’ #Add '\x' before each character
  ```
  
##### Remove lines/characters/text
Remove empty lines in text file
```shell
sed -i '/^$/d' fil.txt    # sed = stream editor - EDITS ORIGINAL FILE
i   edit original file
^   start of line
$   end of line
^$  no characters / empty
d   delete/remove

sed '/^$/d' fil.txt > newfil.txt   # removes empty lines and saves output to new file
```
Remove everything after character `@` with
  ```shell
  echo "username@mail.com" | awk -F "@" '{print $1}'
  ```

#### Sort and count identical lines (statistics)
```shell
sort file.txt | uniq -c | sort -nr
sort file.txt | uniq -c | sort -nr > sorted.txt   # Save output to new file
```

#### Merge files
Merge every .txt file into a bigger text file. Perfect when merging wordlists
```shell
find . -type f -name '*.txt' -print0 | xargs -0 cat > Merged-Everything.txt2   # txt2 excludes the file

wc Merged-Everything.txt2  # is the expected line count reasonable long or are we missing something?
```

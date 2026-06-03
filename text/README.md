# Text

- Remove everyhting after '@' by running `echo "username@mail.com" | awk -F "@" '{print $1}'`
- Generate log in banner with [figlet](https://www.figlet.org/)
  ````shell
  sudo apt install figlet
  figlet Welcome
  ````
- Using icons/symbols
  - https://www.w3schools.com/charsets/ref_utf_dingbats.asp
  ````shell
  printf ☠ | hexdump    #Which outputs:
  0000000 98e2 00a0     #We want the last bit
  0000003
  
  printf ‘\xE2\x98\xA0’ #Add '\x' before each character
  ````
#### Merge files
```shell
# Merge every .txt file into a bigger text file. Perfect when merging wordlists
find . -type f -name '*.txt' -print0 | xargs -0 cat > Merged-Everything.txt2   # txt2 excludes the file

wc Merged-Everything.txt2  # is the expected line count reasonable long or are we missing something?

```

#/bin/bash

#1. Renames every pdf with the text "-NoStarchPress-11.12.2025.pdf"
#2. Adds spaces in words
#3. Prettify by adjusting the end to " - NoStarchPress - 11.12.2025.pdf"

for f in *.pdf; do
  mv -- "$f" "${f%.pdf}-NoStarchPress-11.12.2025.pdf"
done

#run "ls" and ask AI to add spaces between the words. Copy paste them under:
words=(hat python 2e 2nd edition art of cyber warfare mac malware rootkits and bootkits black microcontroller exploits serious cryptography practical malware analysis social engineering pentesting azure applications forensic imaging bug bounty bootcamp locks sport crypto dictionary metasploit volume 2 graphql hacking apis)

for f in *-NoStarchPress-11.12.2025.pdf; do

  base="${f%-NoStarchPress-11.12.2025.pdf}"
  low="$base"
  low="$(echo "$low" | tr '[:upper:]' '[:lower:]')"
  out=""
  rest="$low"
  
  while [ -n "$rest" ]; do
    matched=0
    for w in "${words[@]}"; do
      if [[ "$rest" == "$w"* ]]; then
        out+="$w "
        rest="${rest#$w}"
        matched=1
        break
      fi
    done
    if [ $matched -eq 0 ]; then
      out+="${rest:0:1}"
      rest="${rest:1}"
    fi
  done
  
  pretty="$(echo "$out" | sed -E 's/ +/ /g' | sed -E 's/^ | $//g')"
  pretty="$(echo "$pretty" | sed -E 's/(^| )([a-z])/\1\U\2/g')"
  mv -- "$f" "${pretty} - NoStarchPress - 11.12.2025.pdf"
  ls -l
  echo " " && echo "Done"
done

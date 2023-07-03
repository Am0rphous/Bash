#!/bin/bash
#Author: Am0rphous
#Nb: Using norwegian words

URL="https://gitlab.example.com"
TOKEN="glpat-examplebabla123123"

RED='\033[0;31m'
GREEN='\033[0;32m'
NORMAL='\033[0m'

aktiveBrukere=0
inAktiveBrukere=0
antallMaaneder=6

datoSekunder==$(date -d "$dato" +%s)
idag_unix=$(date +%s)
sixMonths=$(($antallMaaneder * 30 * 24 * 60 * 60))


for ((i=1;i<=12068;i++)); do
  id=$(curl -s --header "PRIVATE-TOKEN: $TOKEN" -H "Content-Type: application/json" "$URL/api/v4/users/$i")
  brukernavn=$(echo "$id"|jq -r '.username')

    if [[ $id == *"last_sign_in_at"* ]]; then
      dato=$(echo "$id"|jq -r '.last_sign_in_at')
      aar="${dato:0:4}"

        if [ $((idag_unix - dato_unix)) -le $sixMonths ]; then
          echo -e "[${GREEN}+${NORMAL}] brukerID '$i' og brukernavn '$brukernavn' $aar"
          aktiveBrukere=$(( $aktiveBrukere + 1))
        else
          echo -e "[${RED}x${NORMAL}] brukerID '$i' og brukernavn '$brukernavn' $aar"
          inAktiveBrukere=$(( $inAktiveBrukere + 1))
        fi
    fi
done
echo ""
echo "Aktive brukere siste $antallMaaneder månedene: $aktiveBrukere"
echo "Inaktive brukere siste $antallMaaneder månedene: $inAktiveBrukere"
echo ""

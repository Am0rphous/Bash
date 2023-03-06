#!/bin/bash

# Temporary dummy script to create a certificate

# Sjekker om brukeren er root
if [[ $EUID -ne 0 ]]; then
   echo -e "\033[31mDenne skriptet må kjøres som root. Prøv igjen med sudo.\033[0m"
   exit 1
fi

# Sjekker om openssl-pakken er installert
dpkg -s openssl &> /dev/null
if [ $? -ne 0 ]; then
   echo -e "\033[33mopenssl-pakken er ikke installert. Vil du installere den nå? [ja/nei]\033[0m"
   read answer
   if [ "$answer" == "ja" ]; then
      apt-get install openssl -y
      echo -e "\033[32mopenssl-pakken er nå installert.\033[0m"
   else
      echo -e "\033[31mopenssl-pakken er nødvendig for å kjøre dette scriptet. Avslutter nå.\033[0m"
      exit 1
   fi
fi

# Spør brukeren om domenenavn
while true; do
   echo -e "\033[33mSkriv inn domenenavnet for sertifikatet (f.eks. example.com): \033[0m"
   read domain
   if [[ -z "$domain" ]]; then
      echo -e "\033[31mDomenenavn kan ikke være tomt.\033[0m"
   else
      break
   fi
done

# Spør brukeren om å bekrefte domenenavnet
while true; do
   echo -e "\033[33mEr $domain riktig? [ja/nei]\033[0m"
   read answer
   if [ "$answer" == "ja" ]; then
      break
   fi
done

# Spør brukeren om stedsinformasjonen
while true; do
   echo -e "\033[33mSkriv inn stedsinformasjonen for sertifikatet (f.eks. Oslo, Norway): \033[0m"
   read location
   if [[ -z "$location" ]]; then
      echo -e "\033[31mStedsinformasjon kan ikke være tomt.\033[0m"
   else
      break
   fi
done

# Spør brukeren om å bekrefte stedsinformasjonen
while true; do
   echo -e "\033[33mEr $location riktig? [ja/nei]\033[0m"
   read answer
   if [ "$answer" == "ja" ]; then
      break
   fi
done

# Oppretter en mappe for sertifikatet
cert_path="./ssl-certs/$domain"
mkdir -p $cert_path

# Oppretter en privat nøkkel
openssl genrsa -out $cert_path/$domain.key 2048

# Oppretter en Certificate Signing Request (CSR)
openssl req -new -

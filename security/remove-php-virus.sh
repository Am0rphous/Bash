#!/bin/bash
FILE=/var/www/wordpress/docs/q89cq.php
if [ -f "$FILE" ]; then
    dato=`date`
    echo "$dato Fila eksisterer. Sletter den!" >> php-virus-logg.txt
    rm /var/www/wordpress/docs/q89cq.php
    echo "Done!" >> php-virus-logg.txt
fi


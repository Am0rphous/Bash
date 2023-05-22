#!/bin/sh
#source: https://en.wikipedia.org/wiki/Shell_script

for jpg; do                                  # use $jpg in place of each filename given, in turn
    png=${jpg%.jpg}.png                      # construct the PNG version of the filename by replacing .jpg with .png
    printf 'converting "%s" ...\n' "$jpg"    # output status info to the user running the script
    if convert "$jpg" jpg.to.png; then       # use convert (provided by ImageMagick) to create the PNG in a temp file
        mv jpg.to.png "$png"                 # if it worked, rename the temporary PNG image to the correct name
    else                                     # ...otherwise complain and exit from the script
        printf >&2 'jpg2png: error: failed output saved in "jpg.to.png".\n'
        exit 1
    fi                                       # the end of the "if" test construct
done                                         # the end of the "for" loop
printf 'all conversions successful\n'        # tell the user the good news

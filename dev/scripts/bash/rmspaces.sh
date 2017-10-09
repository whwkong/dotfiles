#!/bin/bash
# non-recursive implementation
ls | while read -r FILE
do
    mv -v "$FILE" `echo $FILE | tr ' ' '_' `
done

# below also removes characters like {}(),\! and convert the filename to lowercase
# ls | while read -r FILE
# do
#     mv -v "$FILE" `echo $FILE | tr ' ' '_' | tr -d '[{}(),\!]' | tr -d "\'" | tr '[A-Z]' '[a-z]' | sed 's/_-_/_/g'`
# done
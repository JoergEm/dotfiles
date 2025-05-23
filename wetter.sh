#!/bin/bash

echo -n "$(curl -s 'wttr.in/Essen?format=3') " >> ~/motd.txt 2>/dev/null
echo -n -e "\t" >> ~/motd.txt
echo -n "$(curl -s 'wttr.in/Paris?format=3') " >> ~/motd.txt 2>/dev/null
echo -n -e "\t" >> ~/motd.txt
echo -n "$(curl -s 'wttr.in/Madrid?format=3') " >> ~/motd.txt 2>/dev/null
echo -n -e "\t" >> ~/motd.txt
echo -n "$(curl -s 'wttr.in/London?format=3')" >> ~/motd.txt 2>/dev/null
echo >> ~/motd.txt


echo "Guten Tag Jörg!"

cat ~/motd.txt 2>/dev/null

rm ~/motd.txt 2>/dev/null

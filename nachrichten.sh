#!/bin/bash


# Le Figaro
result=$(curl -sL https://www.lefigaro.fr/rss/figaro_flash-actu.xml | xmllint --xpath '//item/title/text()' - | head -n 5 | awk '{print NR, $0}' 2>/dev/null)
if [ -n "$result" ]; then
    echo "-------" >> ~/motd.txt
    echo "Le Figaro:" >> ~/motd.txt
    echo "$result" >> ~/motd.txt
fi

# EL PAÍS
result=$(curl -sL https://feeds.elpais.com/mrss-s/pages/ep/site/elpais.com/portada | xmllint --xpath '//item/title/text()' - | head -n 5 | awk '{print NR, $0}' 2>/dev/null)
if [ -n "$result" ]; then
    echo "--------" >> ~/motd.txt
    echo "El País:" >> ~/motd.txt
    echo "$result" >> ~/motd.txt
fi

# BBC
result=$(curl -sL https://feeds.bbci.co.uk/news/rss.xml | xmllint --xpath '//item/title/text()' - | sed 's/<!\[CDATA\[\(.*\)\]\]>/\1/' | head -n 5 | awk '{print NR, $0}' 2>/dev/null)
if [ -n "$result" ]; then
    echo "----" >> ~/motd.txt
    echo "BBC:" >> ~/motd.txt
    echo "$result" >> ~/motd.txt
fi

# Vokabel des Tages
french=$(curl -sL https://feeds.feedblitz.com/french-word-of-the-day | xmllint --xpath '//item/title/text()' - | awk '{gsub(/<!\[CDATA\[/, ""); gsub(/\]\]>/, ""); print}' | head -n 5 | tr '\n' '\t' 2>/dev/null)
spanish=$(curl -sL https://feeds.feedblitz.com/spanish-word-of-the-day | xmllint --xpath '//item/title/text()' - | awk '{gsub(/<!\[CDATA\[/, ""); gsub(/\]\]>/, ""); print}' | head -n 5 | tr '\n' '\t' 2>/dev/null)
english=$(curl -sL https://www.merriam-webster.com/wotd/feed/rss2 | xmllint --xpath '//item/title/text()' - | awk '{gsub(/<!\[CDATA\[/, ""); gsub(/\]\]>/, ""); print}' | head -n 1 | tr '\n' '\t' 2>/dev/null)

if [ -n "$french" ] || [ -n "$spanish" ] || [ -n "$english" ]; then
    echo "----" >> ~/motd.txt
    printf "\033[34m██\033[0m\033[37m██\033[0m\033[31m██\033[0m %-20s \033[31m█\033[0m\033[33m███\033[0m\033[31m█\033[0m %-20s \033[37m██\033[31m██\033[37m██\033[0m %-20s\n" "$french" "$spanish" "$english" >> ~/motd.txt
fi

cat ~/motd.txt 2>/dev/null

rm ~/motd.txt 2>/dev/null








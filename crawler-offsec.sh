#!/bin/bash
banner()
{
 echo '+-+-+-+-+-+-+-+ +-+-+-+-+-+-+'
 echo '|C|r|a|w|l|e|r| |O|f|f|S|e|c|'
 echo '+-+-+-+-+-+-+-+ +-+-+-+-+-+-+'
 echo 'Desenvolvido por bl4dsc4n'
}
if [ "$#" -ne 1 ]; then
    banner
    echo
    echo "Uso: $0 exemplo.com"
    echo "Obs: nao utilizar http ou https, somente a URL."
    exit 1
fi
banner
wget2 --spider -r ${1} |  grep "Adding URL:" | cut -d " " -f 3 | tee ${1}.txt 
echo "arquivos interessantes"
URLS=$(cat ${1}.txt | grep -oP "\b([a-zA-Z0-9-]+\.)+${1}\b" | sort -u)
echo $URLS
for i in $URLS; do wget2 --tries=1 --connect-timeout=10 --read-timeout=10 --timeout=20 --spider -r ${i} |  grep "Adding URL:" | cut -d " " -f 3 | tee ${1}_full.txt; done

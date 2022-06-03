#/bin/bash

read -p 'Port -r: ' portr
read -p 'Port -p: ' portp
read -p 'Identificator: ' id
echo
echo Installing...
cd ~
wget -O minima_setup.sh https://raw.githubusercontent.com/minima-global/Minima/master/scripts/minima_setup.sh \
&& chmod +x minima_setup.sh \
&& sudo ./minima_setup.sh -r $portr -p $portp;
I=`dpkg -s curl | grep "Status" `
if [ -n "$I" ]
then
    echo "curl installed, set config"
else
    apt install curl -y
fi
curl 127.0.0.1:$portr/incentivecash%20uid:$id
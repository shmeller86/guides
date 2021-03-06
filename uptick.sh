#bin/bash

## Black        0;30     Dark Gray     1;30
## Red          0;31     Light Red     1;31
## Green        0;32     Light Green   1;32
## Brown/Orange 0;33     Yellow        1;33
## Blue         0;34     Light Blue    1;34
## Purple       0;35     Light Purple  1;35
## Cyan         0;36     Light Cyan    1;36
## Light Gray   0;37     White         1;37

echo -e '\033[1;36m'
echo -e ' Me     : https://t.me/chelovek86       | | # \                                      |  '
echo -e ' Channel: https://t.me/xx_log_xx        | ____ \_________|----^"|"""""|"\___________ |  '
echo -e ' Github : https://github.com/shmeller86  \___\   FO + 94 >>    `""""""""     =====  "|D '
echo -e ' Web    : https://4trading.app                 ^^-------____--""""""""""+""--_  __--"|  '
echo -e '                                                           `""|"-->####)+---|`""     |  '
echo -e '                                                                \  \                    '
echo -e '                                                               <- O -)                  '
echo -e '                                                                 `"                     '
echo -e '\033[1;32m UPTICK NODE                                                                    '
echo -e '\033[0m'


function deleteNode {
echo -e '\033[0;37'
echo -e 'NOTHING 🤫'                                                                
echo -e '\033[0m'
}

function updateNode {
echo -e '\033[0;37'
echo -e 'NOTHING 🤫'                                                                
echo -e '\033[0m'
}

function installNode {
sudo apt update && apt upgrade -y
sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils git make ncdu unzip -y

wget -O go1.17.1.linux-amd64.tar.gz https://golang.org/dl/go1.17.linux-amd64.tar.gz
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz && rm go1.17.1.linux-amd64.tar.gz
echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
echo 'export GOPATH=$HOME/go' >> $HOME/.bash_profile
echo 'export GO111MODULE=on' >> $HOME/.bash_profile
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> $HOME/.bash_profile && . $HOME/.bash_profile


read -p "UPTICK_MONIKER:" UPTICK_MONIKER
read -p "UPTICK_WALLET:" UPTICK_WALLET
UPTICK_CHAIN=uptick_7776-1
echo 'export UPTICK_MONIKER='${UPTICK_MONIKER} >> $HOME/.bash_profile
echo 'export UPTICK_WALLET='${UPTICK_WALLET} >> $HOME/.bash_profile
echo 'export UPTICK_CHAIN='${UPTICK_CHAIN} >> $HOME/.bash_profile
source $HOME/.bash_profile


git clone https://github.com/UptickNetwork/uptick.git
cd $HOME/uptick
git checkout v0.2.0
make install

uptickd init $UPTICK_MONIKER --chain-id $UPTICK_CHAIN

curl https://raw.githubusercontent.com/UptickNetwork/uptick-testnet/main/uptick_7776-1/genesis.json > $HOME/.uptickd/config/genesis.json
uptickd unsafe-reset-all

sudo tee /etc/systemd/system/uptickd.service > /dev/null <<EOF
[Unit]
Description=Uptick Network
After=network-online.target

[Service]
User=$USER
ExecStart=$(which uptickd) start
Restart=on-failure
RestartSec=10
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable uptickd
sudo systemctl restart uptickd
}

PS3='Please enter your choice: '
options=("Install" "Update" "Delete" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            installNode
            ;;
        "Update")
            updateNode
            ;;
        "Delete")
            deleteNode
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done






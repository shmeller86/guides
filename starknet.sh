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
echo -e '\033[1;32m STARKNET NODE                                                                    '
echo -e '\033[0m'


function deleteNode {
systemctl stop starknet-node
systemctl disable starknet-node
deluser starknet
rm /etc/systemd/system/starknet*
}

function updateNode {
echo -e '\033[0;37'
echo -e 'NOTHING 🤫'                                                                
echo -e '\033[0m'
}

function installNode {
read -p "HTTP [example:https://eth-goerli.alchemyapi.io/v2/XXXXXXXXXXXXXXXXXX]:" ALCHEMY_HTTP
echo "export ALCHEMY_HTTP="$ALCHEMY_HTTP"" >> ~/.bash_profile


sudo apt update && apt upgrade -y
sudo apt install build-essential libssl-dev libffi-dev python3-dev screen git python3-pip python3.*-venv -y
sudo apt-get install libgmp-dev -y
pip3 install fastecdsa
sudo apt-get install -y pkg-config
sudo apt install curl make clang pkg-config libssl-dev build-essential git mc jq unzip wget -y
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup default nightly
source $HOME/.cargo/env
sleep 1
git clone --branch v0.2.0-alpha https://github.com/eqlabs/pathfinder.git
cd pathfinder/py
python3 -m venv .venv
source .venv/bin/activate
PIP_REQUIRE_VIRTUALENV=true pip install --upgrade pip
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt
cargo build --release --bin pathfinder
sleep 2
source $HOME/.bash_profile

sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF
sudo systemctl restart systemd-journald

sudo tee <<EOF >/dev/null /etc/systemd/system/starknet.service
[Unit]
Description=StarkNet Node
After=network.target
[Service]
Type=simple
User=$USER
WorkingDirectory=$HOME/pathfinder/py
Environment=PATH="$HOME/pathfinder/py/.venv/bin:\$PATH"
ExecStart=$HOME/pathfinder/target/release/pathfinder --ethereum.url $ALCHEMY_HTTP
Restart=always
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl restart systemd-journald
sudo systemctl daemon-reload
sudo systemctl enable starknet
sudo systemctl restart starknet




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






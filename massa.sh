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
echo -e ' Github : https://github.com/shmeller86  \___\   TRTRTRTR >>    `""""""""     =====  "|D '
echo -e ' Web    : https://4trading.app                 ^^-------____--""""""""""+""--_  __--"|  '
echo -e '                                                           `""|"-->####)+---|`""     |  '
echo -e '                                                                \  \                    '
echo -e '                                                               <- O -)                  '
echo -e '                                                                 `"                     '
echo -e '\033[1;32m MASSA TEST.11.0                                                                   '
echo -e '\033[0m'

function installNode {
cd ~;
sudo apt update && sudo apt upgrade -y;
sudo apt install pkg-config curl git build-essential wget jq libssl-dev -y;
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
source $HOME/.cargo/env;
rustup toolchain install nightly;
rustup default nightly;
git clone --branch testnet https://github.com/massalabs/massa.git;
cd $HOME/massa/massa-node/ && cargo build --release
cd $HOME/massa/massa-client/ && cargo build --release

printf "[Unit]
Description=Massa Node
After=network-online.target

[Service]
User=$USER
WorkingDirectory=$HOME/massa/massa-node
ExecStart=/root/.cargo/bin/cargo run --release
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/massa-node.service

sudo systemctl daemon-reload
sudo systemctl enable massa-node
sudo systemctl restart massa-node

echo -e '\033[0;32m'
echo -e 'INSTALLED'                                                                
echo -e '\033[0m'

}
function updateNode {
echo -e '\033[0;37'
echo -e 'NOTHING'                                                                
echo -e '\033[0m'
}
function updateBootstrap {
local config_path="$HOME/massa/massa-node/base_config/config.toml"
	local bootstrap_list=`wget -qO- https://raw.githubusercontent.com/SecorD0/Massa/main/bootstrap_list.txt | shuf -n50 | awk '{ print "        "$0"," }'`
	local len=`wc -l < "$config_path"`
	local start=`grep -n bootstrap_list "$config_path" | cut -d: -f1`
	local end=`grep -n "\[optionnal\] port on which to listen" "$config_path" | cut -d: -f1`
	local end=$((end-1))
	local first_part=`sed "${start},${len}d" "$config_path"`
	local second_part="
    bootstrap_list = [
${bootstrap_list}
    ]
"
	local third_part=`sed "1,${end}d" "$config_path"`
	echo "${first_part}${second_part}${third_part}" > "$config_path"
	sed -i -e "s%retry_delay *=.*%retry_delay = 10000%; " "$config_path"
	printf_n "${C_LGn}Done!${RES}"
	if sudo systemctl status massa-node 2>&1 | grep -q running; then
		sudo systemctl restart massa-node
		printf_n "
You can view the node bootstrapping via ${C_LGn}massa_log${RES} command
"
	fi
}
function deleteNode {

sudo systemctl stop massa-node
sudo systemctl disable massa-node
sudo systemctl daemon-reload
rm -Rf $home/massa

echo -e '\033[0;31m'
echo -e 'DELETED'                                                                
echo -e '\033[0m'

}

PS3='Please enter your choice: '
options=("Install" "Update" "Delete" "UpdateBootstrap" "Quit")
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
        "UpdateBootstrap")
            updateBootstrap
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
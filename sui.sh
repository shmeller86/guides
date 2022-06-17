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
echo -e '\033[1;32m SUI NODE                                                                    '
echo -e '\033[0m'


function deleteNode {
systemctl stop sui-node
systemctl disable sui-node
rm -rf $HOME/sui
}

function installNode {
cd $HOME
source ~/.bash_profile;

GITADDR_DEFAULT=$GITADDR
read -p "Your sui git repository: [default:$GITADDR_DEFAULT | example: https://github.com/shmeller86/sui.git]" GITADDR
GITADDR="${GITADDR:-$GITADDR_DEFAULT}"

apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y --no-install-recommends tzdata git ca-certificates curl build-essential libssl-dev pkg-config libclang-dev cmake
apt install cargo -y
git clone $GITADDR
cd sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git checkout --track upstream/devnet
cp crates/sui-config/data/fullnode-template.yaml fullnode.yaml
curl -fLJO https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
cargo run --release --bin sui-node -- --config-path fullnode.yaml
}

PS3='Please enter your choice: '
options=("Install" "Update" "Delete" "Reset" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            installNode
            break
            ;;
        "Delete")
            deleteNode
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
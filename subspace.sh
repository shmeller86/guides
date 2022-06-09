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
echo -e '\033[1;32m SUBSPACE NODE GEMINI                                                                    '
echo -e '\033[0m'


function deleteNode {
systemctl stop subspace-node subspace-farmer
systemctl disable subspace-node subspace-farmer
deluser subspace
rm -rf /var/lib/subspace
rm -rf /root/.local/share/subspace*
rm /usr/local/bin/subspace*
rm /etc/systemd/system/subspace*
}

function updateNode {
systemctl stop subspace-node
systemctl stop subspace-farmer
sleep 1

source ~/.bash_profile;

SUBSPACE_WALLET_ADDRESS_DEFAULT=$SUBSPACE_WALLET_ADDRESS
SUBSPACE_NODE_NAME_DEFAULT=$SUBSPACE_NODE_NAME
TYPE_DEFAULT=1

read -p "SUBSPACE_WALLET_ADDRESS: [default:$SUBSPACE_WALLET_ADDRESS_DEFAULT]" SUBSPACE_WALLET_ADDRESS
read -p "SUBSPACE_NODE_NAME: [default:$SUBSPACE_NODE_NAME_DEFAULT]" SUBSPACE_NODE_NAME
read -p "TYPE (1-bootstrap;2-list;3-default): [default:1]" TYPE

SUBSPACE_WALLET_ADDRESS="${SUBSPACE_WALLET_ADDRESS:-$SUBSPACE_WALLET_ADDRESS_DEFAULT}"
SUBSPACE_NODE_NAME="${SUBSPACE_NODE_NAME:-$SUBSPACE_NODE_NAME_DEFAULT}"
TYPE="${TYPE:-$TYPE_DEFAULT}"

echo "export SUBSPACE_WALLET_ADDRESS="$SUBSPACE_WALLET_ADDRESS"" >> ~/.bash_profile
echo "export SUBSPACE_NODE_NAME="$SUBSPACE_NODE_NAME"" >> ~/.bash_profile

cd ~
VERSION=$(wget -qO- https://api.github.com/repos/subspace/subspace/releases/latest | jq -r ".tag_name")
wget -O subspace-node https://github.com/subspace/subspace/releases/download/$VERSION/subspace-node-ubuntu-x86_64-$VERSION
wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/$VERSION/subspace-farmer-ubuntu-x86_64-$VERSION
mv subspace* /usr/local/bin/
chmod +x /usr/local/bin/subspace*

if [ $TYPE == 1 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--rpc-cors all \
--rpc-methods safe \
--unsafe-ws-external \
--reserved-nodes="/dns/bootstrap-0.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWF9CgB8bDvWCvzPPZrWG3awjhS7gPFu7MzNPkF9F9xWwc" \
--reserved-nodes="/dns/bootstrap-1.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWLrpSArNaZ3Hvs4mABwYGDY1Rf2bqiNTqUzLm7koxedQQ" \
--reserved-nodes="/dns/bootstrap-2.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNN5uuzPtDNtWoLU28ZDCQP7HTdRjyWbNYo5EA6fZDAMD" \
--reserved-nodes="/dns/bootstrap-3.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWM47uyGtvbUFt5tmWdFezNQjwbYZmWE19RpWhXgRzuEqh" \
--reserved-nodes="/dns/bootstrap-4.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNMEKxFZm9mbwPXfQ3LQaUgin9JckCq7TJdLS2UnH6E7z" \
--reserved-nodes="/dns/bootstrap-5.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWFfEtDmpb8BWKXoEAgxkKAMfxU2yGDq8nK87MqnHvXsok" \
--reserved-nodes="/dns/bootstrap-6.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWHSeob6t43ukWAGnkTcQEoRaFSUWphGDCKF1uefG2UGDh" \
--reserved-nodes="/dns/bootstrap-7.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWKwrGSmaGJBD29agJGC3MWiA7NZt34Vd98f6VYgRbV8hH" \
--reserved-nodes="/dns/bootstrap-8.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWCXFrzVGtAzrTUc4y7jyyvhCcNTAcm18Zj7UN46whZ5Bm" \
--reserved-nodes="/dns/bootstrap-9.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNGxWQ4sajzW1akPRZxjYM5TszRtsCnEiLhpsGrsHrFC6" \
--reserved-nodes="/dns/bootstrap-10.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNGf1qr5411JwPHgwqftjEL6RgFRUEFnsJpTMx6zKEdWn" \
--reserved-nodes="/dns/bootstrap-11.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWM7Qe4rVfzUAMucb5GTs3m4ts5ZrFg83LZnLhRCjmYEJK" \
--reserved-only
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi

if [ $TYPE == 2 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
$(wget -qO- https://raw.githubusercontent.com/shmeller86/guides/master/subspace_addr.txt) \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi

if [ $TYPE == 3 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi




echo "[Unit]
Description=Subspace Farmer
Requires=subspace-node.service
After=network.target
After=subspace-node.service
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-farmer farm --reward-address $SUBSPACE_WALLET_ADDRESS --plot-size 200G
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-farmer.service

systemctl enable subspace-node subspace-farmer
systemctl daemon-reload
systemctl start subspace-node subspace-farmer
}

function installNode {
source ~/.bash_profile;

SUBSPACE_WALLET_ADDRESS_DEFAULT=$SUBSPACE_WALLET_ADDRESS
SUBSPACE_NODE_NAME_DEFAULT=$SUBSPACE_NODE_NAME
TYPE_DEFAULT=1

read -p "SUBSPACE_WALLET_ADDRESS: [default:$SUBSPACE_WALLET_ADDRESS_DEFAULT]" SUBSPACE_WALLET_ADDRESS
read -p "SUBSPACE_NODE_NAME: [default:$SUBSPACE_NODE_NAME_DEFAULT]" SUBSPACE_NODE_NAME
read -p "TYPE (1-bootstrap;2-list;3-default): [default:1]" TYPE

SUBSPACE_WALLET_ADDRESS="${SUBSPACE_WALLET_ADDRESS:-$SUBSPACE_WALLET_ADDRESS_DEFAULT}"
SUBSPACE_NODE_NAME="${SUBSPACE_NODE_NAME:-$SUBSPACE_NODE_NAME_DEFAULT}"
TYPE="${TYPE:-$TYPE_DEFAULT}"

echo "export SUBSPACE_WALLET_ADDRESS="$SUBSPACE_WALLET_ADDRESS"" >> ~/.bash_profile
echo "export SUBSPACE_NODE_NAME="$SUBSPACE_NODE_NAME"" >> ~/.bash_profile

cd ~
VERSION=$(wget -qO- https://api.github.com/repos/subspace/subspace/releases/latest | jq -r ".tag_name")
wget -O subspace-node https://github.com/subspace/subspace/releases/download/$VERSION/subspace-node-ubuntu-x86_64-$VERSION
wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/$VERSION/subspace-farmer-ubuntu-x86_64-$VERSION
mv subspace* /usr/local/bin/
chmod +x /usr/local/bin/subspace*
adduser --system --home=/var/lib/subspace subspace

if [ $TYPE == 1 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--rpc-cors all \
--rpc-methods safe \
--unsafe-ws-external \
--reserved-nodes="/dns/bootstrap-0.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWF9CgB8bDvWCvzPPZrWG3awjhS7gPFu7MzNPkF9F9xWwc" \
--reserved-nodes="/dns/bootstrap-1.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWLrpSArNaZ3Hvs4mABwYGDY1Rf2bqiNTqUzLm7koxedQQ" \
--reserved-nodes="/dns/bootstrap-2.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNN5uuzPtDNtWoLU28ZDCQP7HTdRjyWbNYo5EA6fZDAMD" \
--reserved-nodes="/dns/bootstrap-3.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWM47uyGtvbUFt5tmWdFezNQjwbYZmWE19RpWhXgRzuEqh" \
--reserved-nodes="/dns/bootstrap-4.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNMEKxFZm9mbwPXfQ3LQaUgin9JckCq7TJdLS2UnH6E7z" \
--reserved-nodes="/dns/bootstrap-5.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWFfEtDmpb8BWKXoEAgxkKAMfxU2yGDq8nK87MqnHvXsok" \
--reserved-nodes="/dns/bootstrap-6.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWHSeob6t43ukWAGnkTcQEoRaFSUWphGDCKF1uefG2UGDh" \
--reserved-nodes="/dns/bootstrap-7.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWKwrGSmaGJBD29agJGC3MWiA7NZt34Vd98f6VYgRbV8hH" \
--reserved-nodes="/dns/bootstrap-8.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWCXFrzVGtAzrTUc4y7jyyvhCcNTAcm18Zj7UN46whZ5Bm" \
--reserved-nodes="/dns/bootstrap-9.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNGxWQ4sajzW1akPRZxjYM5TszRtsCnEiLhpsGrsHrFC6" \
--reserved-nodes="/dns/bootstrap-10.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWNGf1qr5411JwPHgwqftjEL6RgFRUEFnsJpTMx6zKEdWn" \
--reserved-nodes="/dns/bootstrap-11.gemini-1b.subspace.network/tcp/30333/p2p/12D3KooWM7Qe4rVfzUAMucb5GTs3m4ts5ZrFg83LZnLhRCjmYEJK" \
--reserved-only
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi

if [ $TYPE == 2 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
$(wget -qO- https://raw.githubusercontent.com/shmeller86/guides/master/subspace_addr.txt) \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi

if [ $TYPE == 3 ]
then
echo "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-node \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--validator \
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service
fi




echo "[Unit]
Description=Subspace Farmer
Requires=subspace-node.service
After=network.target
After=subspace-node.service
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-farmer farm --reward-address $SUBSPACE_WALLET_ADDRESS --plot-size 200G
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-farmer.service

systemctl enable subspace-node subspace-farmer
systemctl daemon-reload
systemctl start subspace-node subspace-farmer
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
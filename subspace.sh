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
    echo "Not yet!"
}

function installNode {
    read -p 'SUBSPACE_WALLET_ADDRESS: ' SUBSPACE_WALLET_ADDRESS
    read -p 'SUBSPACE_NODE_NAME: ' SUBSPACE_NODE_NAME
    echo Installing...
    cd ~
    VERSION=gemini-1b-2022-june-05
    wget -O subspace-node https://github.com/subspace/subspace/releases/download/$VERSION/subspace-node-ubuntu-x86_64-$VERSION
    wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/$VERSION/subspace-farmer-ubuntu-x86_64-$VERSION
    mv subspace* /usr/local/bin/
    chmod +x /usr/local/bin/subspace*
    adduser --system --home=/var/lib/subspace subspace

    echo "[Unit]
        Description=Subspace Node
        After=network.target
        [Service]
        Type=simple
        User=subspace
        ExecStart=/usr/local/bin/subspace-node 
        --chain gemini-1 
        --execution wasm 
        --pruning 1024 
        --keep-blocks 1024 
        --validator 
        --name $SUBSPACE_NODE_NAME 
        Restart=always" > /etc/systemd/system/subspace-node.service

    echo "[Unit]
        Description=Subspace Farmer
        Requires=subspace-node.service
        After=network.target
        After=subspace-node.service
        [Service]
        Type=simple
        User=subspace
        ExecStart=/usr/local/bin/subspace-farmer farm --reward-address=$SUBSPACE_WALLET_ADDRESS --plot-size=300G
        Restart=always
        RestartSec=10
        LimitNOFILE=10000
        [Install]
        WantedBy=multi-user.target" > /etc/systemd/system/subspace-farmer.service

    systemctl daemon-reload
    systemctl start subspace-node
    systemctl start subspace-farmer
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
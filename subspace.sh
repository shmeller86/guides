cd ~
wget -O subspace-node https://github.com/subspace/subspace/releases/download/gemini-1b-2022-june-03/subspace-node-ubuntu-x86_64-gemini-1b-2022-june-03
wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/gemini-1b-2022-june-03/subspace-farmer-ubuntu-x86_64-gemini-1b-2022-june-03
mv subspace* /usr/local/bin/
chmod +x /usr/local/bin/subspace*
adduser --system --home=/var/lib/subspace subspace

SUBSPACE_WALLET_ADDRESS=""
SUBSPACE_NODE_NAME=""

tee <<EOF >/dev/null /etc/systemd/system/subspace-node.service
[Unit]
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
Restart=alwa
EOF

tee <<EOF >/dev/null /etc/systemd/system/subspace-farmer.service
[Unit]
Description=Subspace Farmer
Requires=subspace-node.service
After=network.target
After=subspace-node.service
[Service]
Type=simple
User=subspace
ExecStart=/usr/local/bin/subspace-farmer farm --reward-address=$SUBSPACE_WALLET_ADDRESS --plot-size=200G
Restart=always
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start subspace-node
systemctl start subspace-farmer
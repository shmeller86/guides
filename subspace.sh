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
read -p 'VERSION: ' VERSION
echo Installing...
cd ~
# VERSION=gemini-1b-2022-june-05
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
ExecStart=/usr/local/bin/subspace-node \
--reserved-nodes="/ip4/138.201.155.226/tcp/30333/p2p/12D3KooWQQsUF8f4gptUjJcZHvFyajAUn6LjBgVViS8BgYbQegWh" \
--reserved-nodes="/ip4/77.232.39.4/tcp/30333/p2p/12D3KooWDSG96JySC2cFhojhUW9MQ1MEq7RFP1stAcf8CeBbRVSJ" \
--reserved-nodes="/ip4/5.189.185.187/tcp/30333/p2p/12D3KooWSsN1fDWfakuuag2URZ4iNdZwzEtNYye8PS8Gcir7Vsgu" \
--reserved-nodes="/ip4/88.223.149.161/tcp/30333/p2p/12D3KooWSqcbrdauf5RzpWDE5rZJxWDoh5sdcJBiY1AALLF23Uid" \
--reserved-nodes="/ip4/38.242.196.157/tcp/30333/p2p/12D3KooWF6kVfT8CsufsCSetccS6oMKwJzyDseNAQQr19DyLwRo8" \
--reserved-nodes="/ip4/207.180.227.214/tcp/30333/p2p/12D3KooWBdaih57YUYWsd5BvazbdkJKphpj61jFS69PcTcnbrNpK" \
--reserved-nodes="/ip4/135.181.38.62/tcp/30333/p2p/12D3KooWLhXmiWg8nFV12exXkNj5XWGs2uYYyPyYyBA6F84DVeiK" \
--reserved-nodes="/ip4/116.202.24.182/tcp/30333/p2p/12D3KooWQDdJ1v1sJ7DL4j6TmLYag99mcYqEJj1wnLBVCpk86HLh" \
--reserved-nodes="/ip4/78.46.101.114/tcp/30333/p2p/12D3KooWGKnxmLQoJi1QgLq4TsZX2TaNtgAnwJjmwrTF6BC8YCYi" \
--reserved-nodes="/ip4/65.108.193.177/tcp/30333/p2p/12D3KooWNgZxS5CVRph6ts3tB8V7ZJxcE9PanhgZhcz1eXenD9kQ" \
--reserved-nodes="/ip4/178.18.252.222/tcp/30333/p2p/12D3KooWDx2mzkbcwDYdfGGsJM6u3ABxJkz68XrNLnp1LyUV96s2" \
--reserved-nodes="/ip4/111.9.31.185/tcp/40309/p2p/12D3KooWLWmboVSg1yWEogRmtPVLgH25j4R99ELVVttPrTt3QTFq" \
--reserved-nodes="/ip4/65.108.14.245/tcp/30333/p2p/12D3KooWK4xs79oLzY7FYtcBx8y46Vw4gh8hiyySnAWFN7S5PebH" \
--reserved-nodes="/ip4/65.109.14.222/tcp/30333/p2p/12D3KooWMmShTXeSeia3kWDqLXEmA47gjHCBdqZVtDYiC8kJ4BcY" \
--reserved-nodes="/ip4/65.108.255.46/tcp/30333/p2p/12D3KooWDeDo8QoeqeL9oAwobgQANaWdv9aedms1kWKhorYzyKLN" \
--reserved-nodes="/ip4/92.38.241.101/tcp/30333/p2p/12D3KooWEzFiaMjo7ArFyfbyGNfe3W8zbLWQqMmhigQgY5oEE76j" \
--reserved-nodes="/ip4/135.181.205.38/tcp/30333/p2p/12D3KooWBvmTMP3mu8TsGzBXVbY8RL3df3ihDDiUy4ZNMq8mxqeJ" \
--reserved-nodes="/ip4/38.242.194.202/tcp/30333/p2p/12D3KooWP4N5BHRBWCieeZkfPKTZVG36m1QxfxgDo61BpPs11SQj" \
--reserved-nodes="/ip4/194.163.129.238/tcp/30333/p2p/12D3KooWK1KgioABCHixRewBnPJX43WnoxsUAhD8ua81PzdR8Nok" \
--reserved-nodes="/ip4/65.108.81.109/tcp/30333/p2p/12D3KooWQnMUnembJDdsTqiS6MJ91EXonzVa8Vk4w7qS8RGAuVD5" \
--reserved-nodes="/ip4/164.68.121.142/tcp/30333/p2p/12D3KooWSYL1uuBAJez2MpFjx9MwyYKcjW1wEn7sxxypBX535r98" \
--reserved-nodes="/ip4/38.242.207.70/tcp/30333/p2p/12D3KooWBsgKi3ahL5T3S5LbRRx2sJN5oEh9x9WwXNHm27NksbrT" \
--reserved-nodes="/ip4/146.19.24.200/tcp/30333/p2p/12D3KooWLqUrhiiyWfFdY6uT1nZTsrUkaxNmoyEaRsrpQNXoLyH7" \
--reserved-nodes="/ip4/95.216.159.110/tcp/30333/p2p/12D3KooWDNLBU817EtkhEBe4sgKpKCnmL9vdjqUde4V8MoiEFG3Y" \
--reserved-nodes="/ip4/194.163.137.189/tcp/30333/p2p/12D3KooWAhipJBh1TmweBtUGJi9GZSSvXPehD69GXafzx6YyfH6k" \
--reserved-nodes="/ip4/144.217.201.174/tcp/30333/p2p/12D3KooWHkbz4xeHnZjo9Nrts6CSH9qqjSi4KdGqSx5aBNSfqcBV" \
--reserved-nodes="/ip4/5.189.182.223/tcp/30333/p2p/12D3KooWNqDuGDPQitj4A6HipU2aDTVAo3KQsSGSAzTw2ziE9jtX" \
--reserved-nodes="/ip4/185.182.184.229/tcp/30333/p2p/12D3KooWR6VHdfdosjfDfxvrWLw9jPxKE8J2YeN4vLq2j3zr8cyE" \
--reserved-nodes="/ip4/173.212.239.53/tcp/30333/p2p/12D3KooWQhHzTH5mbpyukXAAVidWPhP8dgtbr8GYjW1kgEe7qe2D" \
--reserved-nodes="/ip4/111.9.31.178/tcp/41206/p2p/12D3KooWKZzuWurvt6gpuAXZWqanmSFQceGfkR1zzNJNPSMSUt1w" \
--reserved-nodes="/ip4/161.97.179.103/tcp/30333/p2p/12D3KooWLqYDbt2dKN1bA7VDucWCyJbegSXnM3uQiqxY22VRdq3A" \
--reserved-nodes="/ip4/161.97.116.150/tcp/30333/p2p/12D3KooWFmsM5SHs9a74n8HFU59wFp8tSzmoNgwCjc6FLeNjDcmS" \
--reserved-nodes="/ip4/38.242.199.243/tcp/30333/p2p/12D3KooWR1tfZ3293gWrZ4gH8RuvgHtTg4i4wFmTtPP7Y4RPPoGo" \
--reserved-nodes="/ip4/38.242.202.216/tcp/30333/p2p/12D3KooWNZiJdsC51zrniSBm7SkjK8BWVUGSyQv8QhKpEBjcE5ca" \
--reserved-nodes="/ip4/185.209.229.151/tcp/30333/p2p/12D3KooWNBkfCnpcdAK7CMDUtgB5xAybvkEySUGfZig3dQfiRWZN" \
--reserved-nodes="/ip4/65.109.1.95/tcp/30333/p2p/12D3KooWDggSkx74gCMyW2LTGkrhpRKJqZLhKBEKtPcpQLg74PhJ" \
--reserved-nodes="/ip4/164.68.114.72/tcp/30333/p2p/12D3KooWJxVUVSEewuNirofHuEtdhBffo4kMKKnDNc6NH94aV8nT" \
--reserved-nodes="/ip4/135.181.251.163/tcp/30333/p2p/12D3KooWBNc6qcPZH8PRTJk8LFZWDvPdrjsAYtarYnYrsypSDnNu" \
--reserved-nodes="/ip4/195.201.19.119/tcp/30333/p2p/12D3KooWJC1rcHUVNbQdCuQAvwHSSzerZ3S6CCML1UsXC1a8ry3G" \
--reserved-nodes="/ip4/185.205.246.116/tcp/30333/p2p/12D3KooWN8xb3tdv3kWoPMRbVxiYFnYCVR16zoBzC7Gvn8xFMs3s" \
--reserved-nodes="/ip4/65.108.13.45/tcp/30333/p2p/12D3KooWEhhRy6dYQqZa9x4aaMUmzRN6N5KJ1GdUBZH2kayLjHMz" \
--reserved-nodes="/ip4/65.108.41.165/tcp/30333/p2p/12D3KooWD6zdGvtR1nzegtbukF1666veav4HysBMZho1gY5QXxRN" \
--reserved-nodes="/ip4/207.180.221.204/tcp/30333/p2p/12D3KooWK87va1EVgPG3UDVqK9wRYrQiTgBAQvAYPycksto7GFYg" \
--reserved-nodes="/ip4/95.111.225.241/tcp/30333/p2p/12D3KooWMSQF5d9Z1zWx1M8TayMStoiiYnHtdFwJYEFgyUPFV2rv" \
--reserved-nodes="/ip4/159.223.227.200/tcp/30333/p2p/12D3KooWB4jkoGEfSTmxEZrymzzUWERHR9CyFcFTQaTV4mPcoREU" \
--reserved-nodes="/ip4/38.242.231.113/tcp/30333/p2p/12D3KooWR34vUJ1MtTAN4KbMxejAgrBvZeooMs8tYA7d4yVe6yZ8" \
--reserved-nodes="/ip4/173.249.50.126/tcp/30333/p2p/12D3KooWA7dwELQoogMKB291tXMNffpH4KDA2gtzG25H8qHsfBBP" \
--reserved-nodes="/ip4/65.21.237.245/tcp/30333/p2p/12D3KooWCzgtADz5ceMZxbwxu3rr2QdrJhPBEPS4W3FkFBdDWkMZ" \
--reserved-nodes="/ip4/195.201.19.14/tcp/30333/p2p/12D3KooWKUWThKMQoWkyg9tr52g58xe4kuTzvwjJpH4qsR59EjFH" \
--reserved-nodes="/ip4/65.109.3.45/tcp/30333/p2p/12D3KooWJsiw9XqxDio64EgszjsAYsX4GoNr5rK8WhADqeemq7zK" \
--reserved-nodes="/ip4/89.208.137.225/tcp/30333/p2p/12D3KooWJWjDxoT5KVJUpCiwFgJUnuvbFtY4e8GNDQ5wYPiKwYWu" \
--reserved-nodes="/ip4/135.181.137.138/tcp/30333/p2p/12D3KooWCh38VvxznkjiUZmrMvcSZoaKgPbwcXcLePRxyNJTJEkN" \
--reserved-nodes="/ip4/5.255.101.199/tcp/30333/p2p/12D3KooWMLMYp5A5boywh8NQLyiFDsA3WU8ZUUS6eQvxWuhMkyCS" \
--reserved-nodes="/ip4/168.119.123.101/tcp/30333/p2p/12D3KooWEBq9m39SG7WUkzMwBXJKPg6qLiniq4bfytpo982k99H3" \
--reserved-nodes="/ip4/38.242.247.5/tcp/30333/p2p/12D3KooWR7MQCpfgb696fxrUXCdVWNwWo2LsfM3HDrHLpEVeH4ps" \
--reserved-nodes="/ip4/117.173.218.133/tcp/40902/p2p/12D3KooWGYGSBvujx3XxyQ8mCYQZmgnZHVksrp7ETUS8hwhQSLUt" \
--reserved-nodes="/ip4/185.209.228.68/tcp/30333/p2p/12D3KooWCoaC4ausvkRJJSpv7Y2rtdPT5j3QNgso8xFQ7FYwdTXk" \
--reserved-nodes="/ip4/95.217.225.7/tcp/30333/p2p/12D3KooWLzR6WTTtKLCzQgDEgrDzeBZR5Ru8Cts6rNXmnQSRiNi6" \
--reserved-nodes="/ip4/38.242.223.200/tcp/30333/p2p/12D3KooWCmqYEqvsf8GsZdt137vcXHJnxG3Lr9JUAX7MsJAKfCrf" \
--reserved-nodes="/ip4/146.190.234.14/tcp/30333/p2p/12D3KooWMAj7kU4xxqChps4W3Mxx5mSYWfMq4TmpoN5UEnZUZcH4" \
--reserved-nodes="/ip4/95.216.157.147/tcp/30333/p2p/12D3KooWMbnjXuWbyZPJPCshkN9RLzTLrVQ62eB8jmccavwAnNCz" \
--reserved-nodes="/ip4/167.235.59.78/tcp/30333/p2p/12D3KooWNyPo9GKaKY9Fu326TXVMJbpNQKdAhZmzxUKCBKtitAZh" \
--reserved-nodes="/ip4/34.132.75.86/tcp/30333/p2p/12D3KooWCpBiv4twfs4LDH8gw7NcUNBXAbdF1grJcPsHLPCtrMiW" \
--reserved-nodes="/ip4/207.180.241.194/tcp/30333/p2p/12D3KooWLqM4wcMAMezTgNuwzrce3Kt2h1WJVWGNtcj1XD2c3fEi" \
--reserved-nodes="/ip4/95.217.221.118/tcp/30333/p2p/12D3KooWCTUSZSW91yvJppFuv6UAni5xMC91whg8yn1ix4FbudRj" \
--reserved-nodes="/ip4/173.249.12.156/tcp/30333/p2p/12D3KooWNxhTHd3ETj4vUJt8bTFhx95bUvqgQo2NggQwWShn88VX" \
--reserved-nodes="/ip4/65.109.12.5/tcp/30333/p2p/12D3KooWHEP8j3MSMQZDhCwTZWxziEXdPgih8tkAqodpFK4K1ify" \
--reserved-nodes="/ip4/144.91.105.209/tcp/30333/p2p/12D3KooWFTxv8drHF8a3S3FWfQznbb8gMnQQ7q27ggqw16aiPhDw" \
--reserved-nodes="/ip4/194.163.172.244/tcp/30333/p2p/12D3KooWP321W2Z6WCySQufy8ziC2KowfejxbnESa5xMjKKxGdEJ" \
--reserved-nodes="/ip4/92.63.97.161/tcp/30333/p2p/12D3KooWGLVANZeQK5pm5nBoCsXkwLemMoC2NmzuwrHTxKACcnw5" \
--reserved-nodes="/ip4/65.108.244.219/tcp/30333/p2p/12D3KooWC4gGB8XYZa5v4UhhVcS8xrd2pd21u8QrPevvPS6VMAqQ" \
--reserved-nodes="/ip4/65.108.27.108/tcp/30333/p2p/12D3KooWAAhoPBfJMRTu83QiBpF16xCq8kApmRT3AMRcfdRmd5QA" \
--reserved-nodes="/ip4/185.194.217.4/tcp/30333/p2p/12D3KooWLT4sEk7d4EtAMAE8DoipNUSXFEZ6s7PKpiipodswpJHY" \
--reserved-nodes="/ip4/185.185.80.208/tcp/30333/p2p/12D3KooWCHED9PjCk6M5D52fzB1HVFAs6v5z9gJDC62yWKfgz95q" \
--reserved-nodes="/ip4/142.132.223.66/tcp/30333/p2p/12D3KooWKABWwS4eVo6Ju284T3hszBRkkWS6mPeWuWCui5sh7zmT" \
--reserved-nodes="/ip4/38.242.253.40/tcp/30333/p2p/12D3KooWLGM1iwNmGpmty8myF3dKq4A2628RNgpK8cM9XgYiF8Q8" \
--reserved-nodes="/ip4/142.132.182.145/tcp/30333/p2p/12D3KooWSt3GZFe3sMioRFnqnXKj2B2oggmHYVPixKoSBbtRvt6y" \
--reserved-nodes="/ip4/154.53.54.154/tcp/30333/p2p/12D3KooWN6wsZZPWHj6oXV7BXKk4y6wZ5dGix5eEa1YYvz6NP7Hz" \
--reserved-nodes="/ip4/5.161.96.27/tcp/30333/p2p/12D3KooWSqg8jWJU2BRQYR8grTEDHxFRQE5FpQyQDc6PRxMpL9UB" \
--reserved-nodes="/ip4/111.9.31.190/tcp/41302/p2p/12D3KooWQCEy9aMSJyoas61K6jdee3XaxMvgjQAVrZCuVTpFvd4A" \
--reserved-nodes="/ip4/5.161.85.85/tcp/30333/p2p/12D3KooWM7EX74hySUsECN5hxL2D1BetbpRZhuT6Ke7RBcmkWqGk" \
--reserved-nodes="/ip4/178.250.247.63/tcp/30333/p2p/12D3KooWRUeqeQSKcTbbWMzZL6phGAACtj4pizZy9dpMnchJoNHU" \
--reserved-nodes="/ip4/161.97.88.206/tcp/30333/p2p/12D3KooWEdJAzSKcT4nJCEfbapQ8eJhhSF4LcZP8Yek92mmKMpar" \
--reserved-nodes="/ip4/65.108.98.62/tcp/30333/p2p/12D3KooWT1G1LNtaUeL7DUNczeS1hcNPoJKZbwn4bKgurschRmwz" \
--reserved-nodes="/ip4/38.242.199.149/tcp/30333/p2p/12D3KooWCFnGZrKeHXTeSA3os2w2cCiPhs14rM5iurgYDGZCuFRs" \
--reserved-nodes="/ip4/194.147.58.83/tcp/30333/p2p/12D3KooWER2sMBviUsumhobkxez29hhjT3wdMUFYyMkBhKVA2zb8" \
--reserved-nodes="/ip4/77.232.39.122/tcp/30333/p2p/12D3KooWAeRcyq7MQ4gDUjuxWfoByEZ6HtoQoztXBKYjPDDnCfQc" \
--reserved-nodes="/ip4/149.102.149.217/tcp/30333/p2p/12D3KooWHnoVdFDfN1WfrW7zuM6AuwwoK6gLggUhKnvzyRBcDYpp" \
--reserved-nodes="/ip4/158.101.166.214/tcp/30333/p2p/12D3KooWGs1ejiqFLfZ1a6K9yUvHEV6B48MqjijLK7UDK1cPXJZf" \
--reserved-nodes="/ip4/161.97.156.137/tcp/30333/p2p/12D3KooW9rNnVuzhAgQjjsjXEHTnPL65cCQdW88SvxYhgeGKpphY" \
--reserved-nodes="/ip4/5.9.100.236/tcp/30333/p2p/12D3KooWGFJVAyKqEEgr54zLHYhkaAH37kYdaF7B7AqafzRjhbWS" \
--reserved-nodes="/ip4/135.181.206.219/tcp/30333/p2p/12D3KooWCDGxzRyYDk3ugyUu7t9aVrcpCWXjEZorMc7YFzoW7Wbu" \
--reserved-nodes="/ip4/51.89.218.191/tcp/30333/p2p/12D3KooWGVV9ztBJm4auAgBN9qpdnmNJ52JHUGbZmyweEJ5dVwsM" \
--reserved-nodes="/ip4/135.181.89.127/tcp/30333/p2p/12D3KooWGa8jguWM5mZ7z1umx3gSmta7wDu3ef2DW6ZKJq125xoQ" \
--reserved-nodes="/ip4/194.147.58.74/tcp/30333/p2p/12D3KooWQSYmQb55PMfSRwGX2XnJaGiULNMzENirxYH1VsadGkE1" \
--reserved-nodes="/ip4/85.192.49.103/tcp/30333/p2p/12D3KooWPnENGkMUrcYUDVXvQjpXjktx45eh9bV1U4CAzC53saFe" \
--reserved-nodes="/ip4/157.90.147.226/tcp/30333/p2p/12D3KooWNMP6jZofSrC9HeoakkRGAHoLQ3F8KM4zfpEx6nqQVxXA" \
--reserved-nodes="/ip4/65.108.104.102/tcp/30333/p2p/12D3KooWEnUq7kAVU9D2kK73A3VK85C4BJEmxjyfYNTvwC1GeSVT" \
--reserved-nodes="/ip4/178.170.47.27/tcp/30333/p2p/12D3KooW9x76B7z3rnfW2QSPXYRUo6SRoWjw29d1BRGVHEKyhzB5" \
--reserved-nodes="/ip4/116.202.217.92/tcp/30333/p2p/12D3KooWMExysPSk7KAoNu9aY7v25qv5V2aQrUJXZwNN2xCkWzup" \
--reserved-nodes="/ip4/193.178.170.203/tcp/30333/p2p/12D3KooWEaEphPVtBHhd12n4zxrEPferxk8cwaCNsdBM3x7pNmop" \
--reserved-nodes="/ip4/117.174.25.129/tcp/40804/p2p/12D3KooWHLefRw64jNFaUQzG6syExuuXT3e6PTYbHcevPouNejPn" \
--reserved-nodes="/ip4/5.161.43.241/tcp/30333/p2p/12D3KooWHTT58SQk6dJQgCsYfrZwNk9ENKBn888djcYHowATZ1S6" \
--reserved-nodes="/ip4/117.174.25.133/tcp/40206/p2p/12D3KooWKHbzK4wX8uxXG9GQxuPZhURAnGmQ2ioxx3hHTgtusi31" \
--reserved-nodes="/ip4/213.202.239.22/tcp/30333/p2p/12D3KooWLQz1hmr7ZVE6q9MUZouek1uhggqvbbeb3AEndKHBWuz5" \
--reserved-nodes="/ip4/185.255.132.220/tcp/30333/p2p/12D3KooWS1CYXfKcAK6VK95nZVDcRVueeovmierCDYF1yeq7CSMy" \
--reserved-nodes="/ip4/94.103.84.98/tcp/30333/p2p/12D3KooWQgoejy92Fuzth8SMPCvwkEfXWFUP5Jtja84tMR3joq4z" \
--reserved-nodes="/ip4/95.142.46.39/tcp/30333/p2p/12D3KooWCZebP6SFCyWmQevL4EX55Xf2c4LPYvkPxy6oQ8MD7VvL" \
--reserved-nodes="/ip4/65.109.9.197/tcp/30333/p2p/12D3KooWRZJdB7C3PoQbdkQimaLUygNcbz5SGvTYq9kxBYHyVj7s" \
--reserved-nodes="/ip4/38.242.205.3/tcp/30333/p2p/12D3KooWPTJi19QHhuP3s3UTaAJwJxUb5XuZHYoaLvfH12ZwTmEp" \
--reserved-nodes="/ip4/138.201.197.170/tcp/30333/p2p/12D3KooWB77Q4LshemVs1bopBSZGTTMvSvWeBe4R6GQScVZCkNkB" \
--reserved-nodes="/ip4/65.108.254.178/tcp/30333/p2p/12D3KooWAjtMxZuEnTqWz9V9sbiRH9fjHvWSxyxGHEkFRMst55xy" \
--reserved-nodes="/ip4/80.82.222.104/tcp/30333/p2p/12D3KooWEvsRyHYxUp8H9PSp1VNEKcaqbqMtybXgRzjE7sqAYbui" \
--reserved-nodes="/ip4/38.242.228.223/tcp/30333/p2p/12D3KooWAnANtKFSuiuq2eXaQmPswtHKq5ASoEqogLP4VsRNbG3m" \
--reserved-nodes="/ip4/65.108.193.174/tcp/30333/p2p/12D3KooWRaareAdgRrtRnz95LBTfMmeDXJT3FbtEfTopJ4SVFdu5" \
--reserved-nodes="/ip4/185.215.165.108/tcp/30333/p2p/12D3KooWF3AbbMkAAsK9Nf5h3r2xkPAMzjfc3N9B66NUr9oMXtCW" \
--reserved-nodes="/ip4/65.108.153.180/tcp/30333/p2p/12D3KooWAqiyPUxKrTsMQB3pA8aP72RqqkRumZCEGAUL2wqD4zzo" \
--reserved-nodes="/ip4/38.242.233.135/tcp/30333/p2p/12D3KooWGtMHr3tLVQzHmZyZKEEqQW6L2vRvBzDAGDLNCNodKkFr" \
--reserved-nodes="/ip4/141.147.1.91/tcp/30333/p2p/12D3KooWShuSALhQfLQNirkfPN3iKVNeAAFLDNvU6ueRQFB1MQEn" \
--reserved-nodes="/ip4/117.173.218.223/tcp/40503/p2p/12D3KooWCqkwWZY4nXFdSmC7PYDCDSU7iZ7GiDEPaooarQtxTzmV" \
--reserved-nodes="/ip4/154.53.32.169/tcp/30333/p2p/12D3KooWPJ68qfJHDMUn9PuW9N66uF1KeEjZM9htj9rw5mpcRm7L" \
--reserved-nodes="/ip4/65.109.14.45/tcp/30333/p2p/12D3KooWNTbBevdHu5cu86h61r2nPs9rye1YtZkniNsmjyDfxQwR" \
--reserved-nodes="/ip4/195.201.164.125/tcp/30333/p2p/12D3KooWBQkezfW7xESWMc3LAu3UEtCkppW8mMKXWDx6YF8CXuQw" \
--reserved-nodes="/ip4/66.94.115.4/tcp/30333/p2p/12D3KooWHzWJAkq1n26pU9rxXZ2yGtzVoyhK2NzrFCeQMUpUkeAF" \
--reserved-nodes="/ip4/134.209.42.87/tcp/30333/p2p/12D3KooWNS2FNTonJXy1ay2LSwCDpAjTgfbkLHtETShiVVZgADfk" \
--reserved-nodes="/ip4/65.108.228.83/tcp/30333/p2p/12D3KooW9wF7EYwYRaaUYL3S3nKSRbfrb65SD7WgnvAcfVHnyx1L" \
--reserved-nodes="/ip4/38.242.219.251/tcp/30333/p2p/12D3KooWRTyZpQKap7jB4PNrPw5sR4ym9uRZ6MpXXCSws63x6tzs" \
--reserved-nodes="/ip4/38.242.199.172/tcp/30333/p2p/12D3KooWBZsRk2smZRkdfj6WCuzEF9NghQQwifhycEVaLtH1Uxod" \
--reserved-nodes="/ip4/65.108.66.215/tcp/30333/p2p/12D3KooWNf2NGCVzxurLTs9DBojwHYJ3bxTvJEC1mJX6NBHF3VkS" \
--reserved-nodes="/ip4/65.109.13.246/tcp/30333/p2p/12D3KooWESJQGgupgqf9Ywk8WpiAhFyNjYMmVdAek2PLbx65MzmJ" \
--reserved-nodes="/ip4/154.53.54.112/tcp/30333/p2p/12D3KooWC9nNaAsjar1Q4vbz8UYoR2cepJUkhvqQK2F2bo6VMTeN" \
--reserved-nodes="/ip4/38.242.202.217/tcp/30333/p2p/12D3KooWHzbg6BvLtL7v3qPkj1MQua43rZNBHn5bzEPEbrpZJj9Y" \
--reserved-nodes="/ip4/173.212.202.114/tcp/30333/p2p/12D3KooWCP39prmR4vsZDtzxyjvfL5JtJxmWSie1yaGFnPsyErbC" \
--reserved-nodes="/ip4/154.53.55.125/tcp/30333/p2p/12D3KooWCQdDyXvgN2QTQVZ8Yuj8tG5V9cLuuxs19Hc7FVknNcPf" \
--reserved-nodes="/ip4/65.108.254.61/tcp/30333/p2p/12D3KooWGf44xXga1bRMbaRqTQNjUUSqnkDfQisURbu7nW2WGRuc" \
--reserved-nodes="/ip4/65.108.68.122/tcp/30333/p2p/12D3KooWLeN46vFtuRHumDjUbTbEnSipz4x1YrAEwhTMoiSkruy5" \
--reserved-nodes="/ip4/38.242.245.217/tcp/30333/p2p/12D3KooWAtNZz7hUYwVDuoi8YedCiCmLCYqtj5N8gqphaEiP35Lb" \
--reserved-nodes="/ip4/95.217.229.167/tcp/30333/p2p/12D3KooWD2hKspV2z9xq8A45h6W1SRxQgn6TTSksmuRb76bEEdjv" \
--reserved-nodes="/ip4/116.203.23.25/tcp/30333/p2p/12D3KooWLhJCaTPjtowdWG9A7ap587eBjPSHXYq5tQcpGj2C4RoD" \
--reserved-nodes="/ip4/38.242.206.184/tcp/30333/p2p/12D3KooWS31M1p3zkpSgj9KBZxCvNcrnosEp9ZjiwvgKYy4WzRoQ" \
--reserved-nodes="/ip4/38.242.235.24/tcp/30333/p2p/12D3KooWJzJqhWkpxEurSyULhrh17ogbPD9wavNtNBu8jRMH2mUn" \
--reserved-nodes="/ip4/111.9.31.164/tcp/40406/p2p/12D3KooWF5PMorJ6LavovMSKq8KcwxL3hRU2XexSTthUdw8m4Kqg" \
--reserved-nodes="/ip4/75.119.149.118/tcp/30333/p2p/12D3KooWBoKJcAyCxMXfKEMJciWRcSdpqw1khdmXpVjH1S4tcFDE" \
--reserved-nodes="/ip4/183.222.174.74/tcp/40610/p2p/12D3KooWRnEYX2tHcd2sHCkBeeaBHrQkUNWZPQzS8kPC4YvRtSDF" \
--reserved-nodes="/ip4/75.119.140.113/tcp/30333/p2p/12D3KooWFpStRA6z82kGyPfpobdhPzoAEbFQ5Yay7CqZh2cnM3iZ" \
--reserved-nodes="/ip4/38.242.200.30/tcp/30333/p2p/12D3KooWSHhGAQJWHbs9bLSJ8DpUv8NLeqpeTeVvTkGsPbhPiiNM" \
--reserved-nodes="/ip4/161.97.179.31/tcp/30333/p2p/12D3KooWKgsQqB599auLnUskgnYYJJRM3Vs1NNdMRMnjhfqq3BsZ" \
--reserved-nodes="/ip4/161.97.179.122/tcp/30333/p2p/12D3KooWHwAQZFpGePzY1ZV2Dxpf8mx7H6j4Nc3Qo7CZpZeZsWTH" \
--reserved-nodes="/ip4/142.132.223.5/tcp/30333/p2p/12D3KooW9phmomZSeCeFLW8p3CyFj1htzf1xdbGWE3pa7bBrvbFG" \
--reserved-nodes="/ip4/117.173.218.133/tcp/40904/p2p/12D3KooWE9TMnBvAhEAkDrGH3ZecMDh2nqJuSerUHDCtfDMVRXfo" \
--reserved-nodes="/ip4/111.9.31.190/tcp/41309/p2p/12D3KooWC5G2TWMGkWaLmFq8a9i2QxUkANh8kG66B4avRF9rvR7k" \
--reserved-nodes="/ip4/117.173.218.208/tcp/40604/p2p/12D3KooWBcSD4QMHEEAjE3v9FghvWr3ebKu4BJ2FcAs7AzereAXd" \
--reserved-nodes="/ip4/185.16.38.31/tcp/30333/p2p/12D3KooWQA1yi7W6YGdcxkTG8YetCMNJ6VYCiHGQFLHFgYufgsgh" \
--reserved-nodes="/ip4/178.18.250.135/tcp/30333/p2p/12D3KooWG8LDXwBfzixvWi8QCeaBB9XrUYkC2r6yWRAA1QKzo2By" \
--reserved-nodes="/ip4/185.209.228.190/tcp/30333/p2p/12D3KooWEmKhCBAetLrRV2gHZHbXCkeWBof9NkAaUAoU5GZWqEm3" \
--reserved-nodes="/ip4/104.193.255.119/tcp/30333/p2p/12D3KooWG5iuYLdXDqg8NhK3U4A2DBLL6Vtw4JNgZ7GK4BqRYDZU" \
--reserved-nodes="/ip4/89.163.132.15/tcp/30333/p2p/12D3KooWNxhv7WgFCK1U8Rz79Vn1VfQsSAVSDUKBLiyZEG6jH43M" \
--reserved-nodes="/ip4/154.53.41.121/tcp/30333/p2p/12D3KooWSXhvjv4LiATtnLK7bDVWGVjCPzeAtBr4xTjJ8DpvxSMX" \
--reserved-nodes="/ip4/65.108.7.44/tcp/30333/p2p/12D3KooWNU4V7vtiAMJGJWn7KaHTm7xJCe46VN2etJScFDykC3fQ" \
--reserved-nodes="/ip4/135.181.92.38/tcp/30333/p2p/12D3KooWB65Yp5EByUX4heMFP28jhx9iGWcvSfWrH7Wj8ZJRTqop" \
--reserved-nodes="/ip4/95.111.228.141/tcp/30333/p2p/12D3KooWKvhbca3C1ueoVJohiRQ7qXozSwfjZWz9ZJuyXKNvUGXm" \
--reserved-nodes="/ip4/62.171.190.71/tcp/30333/p2p/12D3KooWGBfjMNxce74Db5JT5qa7JygL5SNtesN1gpawEaj6CL6Z" \
--reserved-nodes="/ip4/117.174.25.129/tcp/40809/p2p/12D3KooWRJHrngtcJyv6NWuAyigTnVpRgHwrEFbBtzam1RKwhPb7" \
--reserved-nodes="/ip4/77.232.40.86/tcp/30333/p2p/12D3KooWPyz1Jxye51SpFi9m5r18JPLvpgvkymzb2TSrjsycEhfp" \
--reserved-nodes="/ip4/65.109.7.154/tcp/30333/p2p/12D3KooWCPGDq4PEgyYXgPw2iw34R9FDfAPP78caeVtcQr61Bine" \
--reserved-nodes="/ip4/144.91.109.220/tcp/30333/p2p/12D3KooWA73mE5K91YhkRy5VwvauWUKfpjJBRZcAraSFCVNyuoLD" \
--reserved-nodes="/ip4/38.242.230.231/tcp/30333/p2p/12D3KooWRwDqvtoFKe5To4CdjZrycLgRWHa2skHYdJvLAeQV4KWu" \
--reserved-nodes="/ip4/138.201.119.91/tcp/30333/p2p/12D3KooWFX7CvFwDeU8n8fhvRx47GpAheLAyN8HmWTUxo7GxLZ4i" \
--reserved-nodes="/ip4/135.181.79.188/tcp/30333/p2p/12D3KooWEXAt56y1y3WDbY4xTpBsA5VdWH6sLcphU4VGZSo5NrJS" \
--reserved-nodes="/ip4/157.90.131.229/tcp/30333/p2p/12D3KooWL9uqMTDLJ5Nt42W63FgHzDzkWAwM9yJqqzqhZkTCk1G3" \
--reserved-nodes="/ip4/79.137.133.45/tcp/30333/p2p/12D3KooWLStVC779TSEA9jjg1yPDJyrpfkWkt8JjMBi1m6vrEYJh" \
--reserved-nodes="/ip4/5.9.88.248/tcp/30333/p2p/12D3KooWQFtL8QnoizfqKij2gifgeZSnNDRtMq5CRog34GYwTqUW" \
--reserved-nodes="/ip4/78.46.197.57/tcp/30333/p2p/12D3KooWNu9hEMQHq4pY3erAYNCT2CpJGhN7xfn1oy8wu2MGt2mZ" \
--reserved-nodes="/ip4/65.109.11.29/tcp/30333/p2p/12D3KooWAC21epRM5mDu23cNiGsZXmnUYvLcX3xkkxgTNAw6xq2R" \
--reserved-nodes="/ip4/65.108.216.136/tcp/30333/p2p/12D3KooWQiNvwMPRFyzfXighiJppjGkjNhJd5mi3r16eD7298ykH" \
--reserved-nodes="/ip4/5.9.101.92/tcp/30333/p2p/12D3KooWBvxu4mB8Z8Gd8CTzy8nbyFHNttriJ8EPhw1CYq7ZqEdj" \
--reserved-nodes="/ip4/46.228.199.120/tcp/30333/p2p/12D3KooWM5U1RwmUj4R4fNBWUr6d6AK5j29PEmtjvefEDxSiA5dg" \
--reserved-nodes="/ip4/65.21.227.181/tcp/30333/p2p/12D3KooWNUWw6VAwey273vXgYxwr7fYRm2MMFWmSXrctA7ns1Vvb" \
--reserved-nodes="/ip4/117.173.218.222/tcp/41106/p2p/12D3KooWE61YiLhA8gjGMDpuvK7UvSGX8Vwut2ojwfs1vfRGLpqm" \
--reserved-nodes="/ip4/161.97.179.121/tcp/30333/p2p/12D3KooWAgapHCzg3rbhPn5QB4DFSiZfYkzvtager3SQBAUJDkxi" \
--reserved-nodes="/ip4/135.181.5.62/tcp/30333/p2p/12D3KooWStkRkmJofEopDvzMJrLixNAZAK9uWpTcgnaTN2AAdkdf" \
--reserved-nodes="/ip4/38.242.202.36/tcp/30333/p2p/12D3KooWGemM1PLMrwMs4RANUwrE5iY5GkELxAVwRYm8ztPnv2Yz" \
--reserved-nodes="/ip4/164.90.130.109/tcp/30333/p2p/12D3KooWA7C5jDj284HD8Zz4szVAj5Q8RV18mxueDPhayU1njSyk" \
--reserved-nodes="/ip4/62.141.46.174/tcp/30333/p2p/12D3KooWMRViapANfbx8UoAkxr9rstDiAR5AsNPCgedDt8efPajz" \
--reserved-nodes="/ip4/38.242.230.178/tcp/30333/p2p/12D3KooWDvvJunGDKfA1P1dYW33kBrWPFFPNiggLTTjp8ijvcBvS" \
--reserved-nodes="/ip4/173.249.23.208/tcp/30333/p2p/12D3KooWHQFZjXYuiJqraWnYPTnbxcw5M7kvxxPbjGQgSy7gnjni" \
--reserved-nodes="/ip4/83.171.248.254/tcp/30333/p2p/12D3KooWNGtsTDwj5aakap2n1B7JtinMVaNJfUEwE8NFFJPdnXae" \
--reserved-nodes="/ip4/65.108.104.27/tcp/30333/p2p/12D3KooWFZB57q7o2vbznqhtkxVxYjNhFpuPBb3GFBQjoX9JrEFt" \
--reserved-nodes="/ip4/111.9.31.185/tcp/40308/p2p/12D3KooWEzdBtXi4JAyKCGpa76vwSCAJGjKEMP6FS1Qkdkwzd3LH" \
--reserved-nodes="/ip4/94.130.236.174/tcp/30333/p2p/12D3KooWRjbUvffmFcVrxyZxXBHX1jt1BugbTnpwqjngxpCNXiHY" \
--reserved-nodes="/ip4/142.132.144.109/tcp/30333/p2p/12D3KooWA4f2rqHprWnNeswVqjZCJT8PcrPHHQ4CuWYUXptTGXAf" \
--reserved-nodes="/ip4/135.181.166.16/tcp/30333/p2p/12D3KooWHuFvfJCbP3SMWNNgc4tPUkMCqtAVcDs56L4pVKvUa9m5" \
--reserved-nodes="/ip4/206.189.97.174/tcp/30333/p2p/12D3KooWQFztAyp3zDtVA9x4n47yFB7C3DWUoxGh6J4dEXYQBD8g" \
--reserved-nodes="/ip4/117.173.218.222/tcp/41105/p2p/12D3KooWHLYZ5i6pq4vzyBJHi3M9n7bu2QxfAD7E8ydEEZ8CbJtE" \
--reserved-nodes="/ip4/5.161.55.203/tcp/30333/p2p/12D3KooWQ2RchJQDx42PeWDZey1Vjn8UhJ9Bc45TQHLDXsdaZY56" \
--reserved-nodes="/ip4/38.242.253.42/tcp/30333/p2p/12D3KooWPXosUsP461626s5NpmgJFWsTKy78jWptvepgiPGyTeUU" \
--reserved-nodes="/ip4/164.92.96.115/tcp/30333/p2p/12D3KooWDmf7qSEBtYqC5CAbKBtUZFogycH4u1kUnBDG5thLg9tF" \
--reserved-nodes="/ip4/38.242.202.152/tcp/30333/p2p/12D3KooWNr7xyiGTmUjbJU44dHufh2qKYHdkXpyGD5wehwYZY92t" \
--reserved-nodes="/ip4/188.120.238.54/tcp/30333/p2p/12D3KooWH2K8T7tc7GXdXvCaGdLRm3a7JtTAriPEbwGLnfxbCXU8" \
--reserved-nodes="/ip4/95.214.55.53/tcp/30333/p2p/12D3KooWRY9sg9L639LJP3F9NB8CMheqbkq7tGfwAnUB4pgWRZky" \
--reserved-nodes="/ip4/83.171.248.144/tcp/30333/p2p/12D3KooWKKDDsMzCxZC8XnJnvwMRZ7a1oGHW323Geq3zhZmYaXAV" \
--reserved-nodes="/ip4/38.242.195.66/tcp/30333/p2p/12D3KooWB1BpQGnw867TfrPCez1VvkQkEMVowv3MHvtsAh5U2tgN" \
--reserved-nodes="/ip4/135.181.80.9/tcp/30333/p2p/12D3KooWSusc8xkmCBaZGMajdZWXoiFh9yy1BmkbaGSDZjyRL1PX" \
--reserved-nodes="/ip4/37.120.163.80/tcp/30333/p2p/12D3KooWSFn4UAQvruiJFLDJ1m5xMvqcztMmxEZgbAXyqpbjF7TT" \
--reserved-nodes="/ip4/95.216.189.138/tcp/30333/p2p/12D3KooWPmMYtCzo5avfQok1PGTeKXAbbf18WUAhx1TZh51UJDAG" \
--reserved-nodes="/ip4/185.244.183.225/tcp/30333/p2p/12D3KooWMzzu1RHC2cNApwdyNPh3zVXCWBL71Soj2uq2LnyvJhLZ" \
--reserved-nodes="/ip4/117.173.218.222/tcp/41109/p2p/12D3KooWRVWEHzfaZUhHfaawBDKJNNVLG6eL3iJVKvLozGvYJ3ez" \
--reserved-nodes="/ip4/162.55.238.249/tcp/30333/p2p/12D3KooW9ryR6m1Y3qDwKjdJM9KLPf9Rv6yPx6JcXDqHUsxu6Ej4" \
--reserved-nodes="/ip4/88.218.168.205/tcp/30333/p2p/12D3KooWMeVvP4sic4uRn3Jncuhu3sNWVdpFMkpG2JUzGx1ZtS1Z" \
--reserved-nodes="/ip4/5.161.85.146/tcp/30333/p2p/12D3KooWRkMmgs8XXxvbHJu5KnryeWKqZMeZVmUAWiYwwbRmwC3Z" \
--reserved-nodes="/ip4/38.242.201.5/tcp/30333/p2p/12D3KooWRLWvExYXPRD7ieY8V1H8ydUbYinMQ9BveTCeszFw3oC6" \
--reserved-nodes="/ip4/38.242.253.240/tcp/30333/p2p/12D3KooWHzaRwCLctZpH7JEZUy12Mu71tdvmRacJBY3SecSEuEZ9" \
--reserved-nodes="/ip4/146.19.24.250/tcp/30333/p2p/12D3KooWBqYciuGujKb96AWVKp5HmVmihbhjpVnCqv1pamKAphY2" \
--reserved-nodes="/ip4/95.111.231.238/tcp/30333/p2p/12D3KooWEgK6opQfR2vvWpJ1vzzfydXNoDJ8ZPmJnLoTVYiQmJYK" \
--reserved-nodes="/ip4/65.108.85.119/tcp/30333/p2p/12D3KooWB72iFwpihBMmF5E3hdQH1vGxfDnENVg551QURH9t9Afc" \
--reserved-nodes="/ip4/157.90.161.124/tcp/30333/p2p/12D3KooWKQ4FA827LUgYThdhTPnXSqZXgM4MMWUzw22mpmcYG6VR" \
--reserved-nodes="/ip4/38.242.252.139/tcp/30333/p2p/12D3KooWFoSTuS3j2TPnyU6PJZrXeXF5RohrjbG5i9VHCoCJKXE4" \
--reserved-nodes="/ip4/130.185.118.141/tcp/30333/p2p/12D3KooWEa7EbxETKyodYsY9VaGgzs6Na7mTKPRvSSyUjgTmf5VP" \
--reserved-nodes="/ip4/159.69.209.122/tcp/30333/p2p/12D3KooWQHhRMMgnXfAJnZtMvnUNfxHcYq7fKjxBKLgBDvrrU6tg" \
--reserved-nodes="/ip4/178.18.255.190/tcp/30333/p2p/12D3KooWFf9VNrjxwgofyJbBioZKMpCRwNc9Tx5qkMpDi9cUFQWw" \
--reserved-nodes="/ip4/66.94.115.39/tcp/30333/p2p/12D3KooWMv1SkAEN5VEdn3KbSkEbRJdJ9QPTtgBGWDvjo1yVA8pY" \
--reserved-nodes="/ip4/194.163.148.0/tcp/30333/p2p/12D3KooWEDxTGd4JFDtofSUUo1Tko7i9D66Byf2Mz71h2LsPsD2W" \
--reserved-nodes="/ip4/65.108.44.221/tcp/30333/p2p/12D3KooWDgaTiw5PYsBofgMPN4KwTvDwDDGfkFU94qYp2L3wL64P" \
--reserved-nodes="/ip4/95.217.217.254/tcp/30333/p2p/12D3KooWM8F7AmFCgJ8zgjQHsuooLK4uTYD3TBrnWhbhnxyjKiP4" \
--reserved-nodes="/ip4/38.242.249.70/tcp/30333/p2p/12D3KooWDjAfPSKxcimBQwueRjG6sT7YgnMdnnnsX9uYdUNLLX3E" \
--reserved-nodes="/ip4/194.60.201.222/tcp/30333/p2p/12D3KooWQr62gHhU5j3sHzYYknXgJu2y63nJF2kZCQGAeEqH6yHU" \
--reserved-nodes="/ip4/129.213.24.144/tcp/30333/p2p/12D3KooWCvKErD7tZMVEo4yVMUqLzXMbYEt5bAZ3KiJ9gCB61JWn" \
--reserved-nodes="/ip4/89.22.224.146/tcp/30333/p2p/12D3KooWAyfGicLw5bLFyXJyqDcQ8anF9sXddcn7BaDELCZWjQWd" \
--reserved-nodes="/ip4/65.108.252.148/tcp/30333/p2p/12D3KooWJt9tvYfxTepLURRaTbFNiKpfECjiTXpu2eQQDhyxYuA9" \
--reserved-nodes="/ip4/75.119.147.155/tcp/30333/p2p/12D3KooWNM9jEZbS95jnFzCxbANHcjptkbZy3n3z1F6hxDWaym7P" \
--reserved-nodes="/ip4/95.217.217.253/tcp/30333/p2p/12D3KooWF7mPXUkZy3iY7stVBivj2imeo3U2v5sV8AZEDmeeTpdT" \
--reserved-nodes="/ip4/95.217.217.167/tcp/30333/p2p/12D3KooWFyJSdo23brJTGRKx4BKu2cE9i3Wj96ygGT2RyQBwBrZg" \
--reserved-nodes="/ip4/117.175.48.242/tcp/40207/p2p/12D3KooWLoBPc4sMVRpfDDgokxYajJ1aBM9sx5uDFQJBzeAJm9ak" \
--reserved-nodes="/ip4/5.189.154.248/tcp/30333/p2p/12D3KooWQAGbtoSCkKVB7NGsUGudd9TZTvQt74vj78nsLh5G2R1P" \
--reserved-nodes="/ip4/111.9.31.178/tcp/41204/p2p/12D3KooWSEuURRbcC98j5J7JrvwfDasnuLYpPi9xmxwZuRiDhKDV" \
--reserved-nodes="/ip4/65.108.89.216/tcp/30333/p2p/12D3KooWQQwGCwEXQQebBKHFqiqAhwrVVUF13shSnFL6MCf3C6yq" \
--reserved-nodes="/ip4/65.21.237.94/tcp/30333/p2p/12D3KooWA2GCfHJcvuMcpyrxpyW7w9AHQz319ERSvJv5NYmTAuwX" \
--reserved-nodes="/ip4/136.243.147.181/tcp/30333/p2p/12D3KooWMghTozorUJb9cCUvohpwoWngeRpsvZpDkfdrjhLFCodj" \
--reserved-nodes="/ip4/194.147.58.87/tcp/30333/p2p/12D3KooWReURtt3pmyhjKySqwokDiLpyGxHSccsjaW7y2ERrbf1R" \
--reserved-nodes="/ip4/95.217.216.76/tcp/30333/p2p/12D3KooWDpJi8p868QC7xqQKUrf26TfXL1MNgoSFUm5vj1CDaGNY" \
--reserved-nodes="/ip4/65.109.10.147/tcp/30333/p2p/12D3KooWGEF8fXx1qsDX1cG2rwSsk7GmQdGfqxXNVov6iGgsyLj3" \
--reserved-nodes="/ip4/173.212.195.151/tcp/30333/p2p/12D3KooWEFtj65zgpA4cxbZuXrHE64d6y5e84aJZ5P9iJJ3cMXXv" \
--reserved-nodes="/ip4/213.136.83.102/tcp/30333/p2p/12D3KooWJMHwg9eKycDb7bnmHVV7JPCuoW5UMjqPH9Z5MrLWa4Dh" \
--reserved-nodes="/ip4/65.108.75.183/tcp/30333/p2p/12D3KooWB6u1GUysvFteWtxpuoPAZmTNHp7btZHqk2jt5pz1wRPX" \
--reserved-nodes="/ip4/195.3.221.150/tcp/30333/p2p/12D3KooWCgdWzbmxn2dhEoJf7SfQBp7Nad2MfxNcqXfrnqZP5AUU" \
--reserved-nodes="/ip4/65.108.4.155/tcp/30333/p2p/12D3KooWEAVQAWmoC17B1HJP4mnFPvthw8G3SMFQYMtJ5P2hLWPK" \
--reserved-nodes="/ip4/75.119.131.28/tcp/30333/p2p/12D3KooWQ9xiJyhmiXG7FU2oP2ZGMSktTnpmMSi8EKi44tmLsSzr" \
--reserved-nodes="/ip4/185.252.233.67/tcp/30333/p2p/12D3KooWGgQdqYpVd8VNqABbZA46tn3K5i4wtsFrVX1KJ5se4uwA" \
--reserved-nodes="/ip4/159.223.238.255/tcp/30333/p2p/12D3KooWGN44tCfPN7xuh1YBfrMXXZbAro2grtHEXrgFAeoRj2HZ" \
--reserved-nodes="/ip4/65.21.225.176/tcp/30333/p2p/12D3KooWJ4gibuF9PxZVmQx1yWEP2rWAoVLQ4K8PWoG9ohpDNHsT" \
--reserved-nodes="/ip4/135.181.221.77/tcp/30333/p2p/12D3KooWMRrBBXtn56AozxhVEf5ZPnLKfV4ngBP5egQA8MRDhjmM" \
--reserved-nodes="/ip4/65.109.13.62/tcp/30333/p2p/12D3KooWMt6TKiYxd7qunbkZGjoGe5M6mwqHrESDhzdhHgY7D7uX" \
--reserved-nodes="/ip4/45.94.58.14/tcp/30333/p2p/12D3KooWJsnCqubioTCGmLueDtArnUgUUN1Lc1fU6YZGRrp4WWqY" \
--reserved-nodes="/ip4/195.2.79.29/tcp/30333/p2p/12D3KooWJgL8EbKTcaAbS3y624tHw8YDFmCoqjePCaQXSLkjKf4V" \
--reserved-nodes="/ip4/135.181.29.114/tcp/30333/p2p/12D3KooWPJzrbU5unCzdvWhnJ4fcZgeoHbXhRY3qFQninoMHyVSR" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40710/p2p/12D3KooWPTXkTGvn1P5yi524fWDjReiaWbryReFwo9wttpfNVFe8" \
--reserved-nodes="/ip4/194.163.154.169/tcp/30333/p2p/12D3KooWSUxu3HaiQnnbt6fyC6r1TWFWZDNGad8K6ZvX9Sur2WZ5" \
--reserved-nodes="/ip4/65.108.245.242/tcp/30333/p2p/12D3KooWBeSvBeknNRaN7GSU6RRYDb6QTs1JoLSGUDzag2WGrpVs" \
--reserved-nodes="/ip4/194.163.149.238/tcp/30333/p2p/12D3KooWFMGyyNN9vy9DywwLPhzJB9BXfyGZXSjGQ7rgveYemZan" \
--reserved-nodes="/ip4/109.107.183.218/tcp/30333/p2p/12D3KooWLn3iTP1d8ygnnAh5beihh1GzkCEriMfYptNdpsAVpW71" \
--reserved-nodes="/ip4/65.108.82.136/tcp/30333/p2p/12D3KooWRAwRsECLisAFJ585EYtdk4R9GF5XgVCJFaVFdDPVznrh" \
--reserved-nodes="/ip4/85.192.49.152/tcp/30333/p2p/12D3KooWLZwqas1DUExtKrYDvZeYg9uEW7VKQmibH41ePjaaNS48" \
--reserved-nodes="/ip4/161.97.179.126/tcp/30333/p2p/12D3KooWP3sddue7SwDwAn5Akq4p1xhEoMerfczMqxyfXAxJEVXS" \
--reserved-nodes="/ip4/65.108.15.86/tcp/30333/p2p/12D3KooWM9LhfT4QV5RWp47GN7D6B1yvyuYbAuJGmVBb5LVH57XC" \
--reserved-nodes="/ip4/157.90.249.15/tcp/30333/p2p/12D3KooWGdhxkzcmMoJGPaFUiv7uKAyD5G752o9WR3c3eRdg3nJc" \
--reserved-nodes="/ip4/188.40.133.177/tcp/30333/p2p/12D3KooWDasMFRGJAPkfdDt9VJeMAKaUWV9NEt9XL64JxF3MARcz" \
--reserved-nodes="/ip4/111.9.31.191/tcp/40702/p2p/12D3KooWSe2TYSn749ncPRgfkWDjD4pmQ8xndaC8uox3DDm3fmpY" \
--reserved-nodes="/ip4/38.242.220.170/tcp/30333/p2p/12D3KooWPTdV7NxB8973mULAHbYKnJMeyntGwW34f7qfayj8CfkY" \
--reserved-nodes="/ip4/75.119.158.220/tcp/30333/p2p/12D3KooWDutLyx3yBPx9si8oHTo6RDKs7gZMiywwbCsrt6fL6j8C" \
--reserved-nodes="/ip4/143.110.231.148/tcp/30333/p2p/12D3KooWLaM8vroyjxdHAgH4SxWh9k4JzCXdwnYk3FhkG9TM6Twk" \
--reserved-nodes="/ip4/49.12.247.227/tcp/30333/p2p/12D3KooWA9Fdn7DkJUFAVjmixVz1EyKjDaEzWnm5q8smWSfkodpz" \
--reserved-nodes="/ip4/65.109.2.111/tcp/30333/p2p/12D3KooWMgQ3Wovp6cAHJMJZKK13fDvTxK9WV2VpAM1qxKAakN3Q" \
--reserved-nodes="/ip4/135.181.38.191/tcp/30333/p2p/12D3KooWCyBCsuDscviENM3jjQZHzrNakbLxp9cHi1uPg5UYDrHm" \
--reserved-nodes="/ip4/117.174.25.133/tcp/40211/p2p/12D3KooWLrxLSnWTV7koTBR2HfWvoks2fdCNbWeDEYMbuaGiRwQL" \
--reserved-nodes="/ip4/65.109.11.55/tcp/30333/p2p/12D3KooWSHH6MApsJPhytdSNumRNK872ccRFcW7ZzLtLatHinz7A" \
--reserved-nodes="/ip4/183.222.63.188/tcp/41006/p2p/12D3KooWJni44Sn6gYZFN9oHTtGn52uRaT8q3fWeYUHsh4gCog2y" \
--reserved-nodes="/ip4/149.102.153.94/tcp/30333/p2p/12D3KooWEKJi94KMQ3APmvanTGFdgFPJe6ZvXLgUYik3FjNMy3es" \
--reserved-nodes="/ip4/65.108.142.169/tcp/30333/p2p/12D3KooWSHgnZykX1EwxeC4sZriugWR3N7H95RzgLwc8odGjrNVh" \
--reserved-nodes="/ip4/178.18.248.202/tcp/30333/p2p/12D3KooWDW3sWzQhZ4vsNXyMgc5L2kwimm2mQYN1G3onGFhSu8U2" \
--reserved-nodes="/ip4/49.12.188.53/tcp/30333/p2p/12D3KooWSDPnEjtcS5b2mTsVPRas94dx7tmhCLLmix247UcrU9uT" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40707/p2p/12D3KooWK8oRQwCEAvG3P4W29TMSrHiCAt3gSiD5Fv1atNXYUSph" \
--reserved-nodes="/ip4/117.174.25.133/tcp/40209/p2p/12D3KooWRgG7hokzSgdZKVPFUBTHWPAGB1HxkNPbc15VkmUqf3Zi" \
--reserved-nodes="/ip4/209.126.87.39/tcp/30333/p2p/12D3KooWRDc5feLEmv5wvc6zozVQXayYDWrVYAnbCZxFmnwupu1h" \
--reserved-nodes="/ip4/65.108.142.172/tcp/30333/p2p/12D3KooWJrckoYD66qJMqLezh1YP3rtLD4hmu5R49gN1NY7S9mBR" \
--reserved-nodes="/ip4/178.250.246.107/tcp/30333/p2p/12D3KooWFa6x2RMWiDg5TEx36nQYZVw52VmBfLzmPDyvWFDjcMh4" \
--reserved-nodes="/ip4/38.242.207.69/tcp/30333/p2p/12D3KooWCER42ss7aWAyL9gDs3pbYDDzpDcrd1KTVCouj59iSj4X" \
--reserved-nodes="/ip4/62.171.135.20/tcp/30333/p2p/12D3KooWQRRVdEC3Tu2cxrwfpVQAQPezL3V67kR6aNfD5FBSodcv" \
--reserved-nodes="/ip4/65.108.246.80/tcp/30333/p2p/12D3KooWPpyutA8eDjuM8nnbraAvFbDXaaLHzsEjcvtSY7EAnEMT" \
--reserved-nodes="/ip4/207.244.236.61/tcp/30333/p2p/12D3KooWPJp9XCaBDnyMTmoJRhtCoBo41sadDq5eQ9oFhHVEawfj" \
--reserved-nodes="/ip4/185.252.234.103/tcp/30333/p2p/12D3KooWQHhVkkqX4PY4T1Zjj2zq6wNob7Rr4316GEE6UQLiGGzE" \
--reserved-nodes="/ip4/111.9.31.176/tcp/40402/p2p/12D3KooWE9kWrbD1WaSwNYDCWiWFmKaPvjgYXAqAutkbsBMgAWXF" \
--reserved-nodes="/ip4/95.165.133.62/tcp/30333/p2p/12D3KooWM6ma6wgywBQKfh4sJHYJ2rqmuvfdPmjisQFiTSo7RecV" \
--reserved-nodes="/ip4/154.53.55.9/tcp/30333/p2p/12D3KooWPxNcJn6KPAC6pSyFcbyYN9FwiErpoadcG84uGi6ckRCj" \
--reserved-nodes="/ip4/95.216.29.227/tcp/30333/p2p/12D3KooWSG9aJudaiUrhP31mGVKptPHiF7aCSgH7ibag3ET7ra3c" \
--reserved-nodes="/ip4/149.102.149.218/tcp/30333/p2p/12D3KooWDkVK3soRVmrN7WrdzxyWtvAnaa2SszHKbaJ8yBp6uqEA" \
--reserved-nodes="/ip4/38.242.252.140/tcp/30333/p2p/12D3KooWA2v5B7NVgQA3DtqbdVSqkGsN69jXz5uG1GEpco6Yn9PU" \
--reserved-nodes="/ip4/65.108.246.81/tcp/30333/p2p/12D3KooWQxushapgYf45TppJ9f8SPQnn4eYMMYZQG5B9KVTmvAUW" \
--reserved-nodes="/ip4/183.222.63.208/tcp/40808/p2p/12D3KooWHkCKCTWyL1ApWjMVrNcaPcrk6LfPai7oLGBTpL6cGewi" \
--reserved-nodes="/ip4/95.217.158.124/tcp/30333/p2p/12D3KooWNb5S6D3vgEjsXGtEt6T67pQit1wm4L8f7fnkRexfeRF3" \
--reserved-nodes="/ip4/38.242.199.220/tcp/30333/p2p/12D3KooWHco1tC8kpVsKYiJkAq5BPhUTNnGqR2N8DxndyjLnQMJg" \
--reserved-nodes="/ip4/176.124.220.128/tcp/30333/p2p/12D3KooWFmkBozD39QpDWCv4iVp8wy73on18xWsDHDKnYwKorZCf" \
--reserved-nodes="/ip4/188.40.106.217/tcp/30333/p2p/12D3KooWB6Wc2r5M3yisCyHK5juzr2ganKRySEv93g9brb5BfA2M" \
--reserved-nodes="/ip4/161.97.142.218/tcp/30333/p2p/12D3KooWGd45uqy3kxoqFRv684djq3pG9wv7M19VZiWUwi6tkGvz" \
--reserved-nodes="/ip4/38.105.209.187/tcp/30333/p2p/12D3KooWEjNdr6aAYAyFqvXMnST14XQFLepAxxCdFy18XRVxPXrv" \
--reserved-nodes="/ip4/117.174.25.133/tcp/40200/p2p/12D3KooWA4Mr77yM2hXGgMCdTNyDnGs7JCj22k6sbCaN3ir2bLHt" \
--reserved-nodes="/ip4/46.227.70.211/tcp/30333/p2p/12D3KooWNkfYXWmX94rWAYsiYfCzumEeXKgRBBqPHg5TSdNwYYvp" \
--reserved-nodes="/ip4/94.130.135.171/tcp/30333/p2p/12D3KooWLF58sex83FFktdni4zjectTPRfPto8RGMa4S1GuNfdLB" \
--reserved-nodes="/ip4/135.181.91.243/tcp/30333/p2p/12D3KooWRmVVT1QGJWqrCfgc93UP2GVj8LYsuFu5RFNMYfdFdYMc" \
--reserved-nodes="/ip4/38.242.250.204/tcp/30333/p2p/12D3KooWLBenaLvzsBRxRcrAMdC3KypxYxaQHvngWH1PQ7GBnB5w" \
--reserved-nodes="/ip4/65.108.246.82/tcp/30333/p2p/12D3KooWHirZF5iMmmSrZFicpS8XMXWUdHWTbDvdx7UG4x3DDKVW" \
--reserved-nodes="/ip4/185.185.83.141/tcp/30333/p2p/12D3KooWH9avrw88v3pctJUBrRnxZAVNq9UbMtDPgQuHVTcaLjrV" \
--reserved-nodes="/ip4/94.250.248.45/tcp/30333/p2p/12D3KooWD8WubTfgj7FXM35KnicC4hU2VDkT4HqgG6q5JA6cizVF" \
--reserved-nodes="/ip4/38.242.227.6/tcp/30333/p2p/12D3KooWAKPmFDDS5nnwsX86bh4ffvs4BquVZuLw6e9LrUrPuJtz" \
--reserved-nodes="/ip4/49.12.238.90/tcp/30333/p2p/12D3KooWHiGMK6nRdabd2WnDQVKo9aHH5s1VwaoAhTkuY25XHyEX" \
--reserved-nodes="/ip4/65.108.45.233/tcp/30333/p2p/12D3KooWJ1JSdCg9Cen2hakRkx6v2Si6CW97hFN72SSN6pEqxkQt" \
--reserved-nodes="/ip4/49.12.69.213/tcp/30333/p2p/12D3KooWBJDEzsZV4Jqr7gkP2rQwJR9GpN6Re8QGwDrb9g1T9nPk" \
--reserved-nodes="/ip4/66.94.119.47/tcp/30333/p2p/12D3KooWHELpTs9Kcihx63AkekpsdbaiUsPFLRgRPYJCHdiaWMqQ" \
--reserved-nodes="/ip4/111.9.31.191/tcp/40709/p2p/12D3KooWQ4YxkW4Tb9ENSeQmFSgmciJjqZF7pvf5MytpKvUJLAKj" \
--reserved-nodes="/ip4/194.163.148.42/tcp/30333/p2p/12D3KooWAYnUtYAUPkTVgJJ3iWBZnXpWzHiS1Snfc9aNx8TEsXWK" \
--reserved-nodes="/ip4/5.161.43.35/tcp/30333/p2p/12D3KooWLNrUbf35CPUVxmc4QcaE4k8aP83yc2XTca7dSd4F2Uza" \
--reserved-nodes="/ip4/95.217.211.135/tcp/30333/p2p/12D3KooWBaKfhc63DBc2cVgtEb9nzpAPHBkCj6je7z3S4HWJMuiP" \
--reserved-nodes="/ip4/135.181.198.82/tcp/30333/p2p/12D3KooWQLSHvutw8zW59DSvEPNitgVU93MCWe4hLdAt7h6HCFiQ" \
--reserved-nodes="/ip4/5.164.29.175/tcp/30333/p2p/12D3KooWAoA9FknNP3tETamwufeWBMyVV1ovyVW1Fi9LUM9MxERT" \
--reserved-nodes="/ip4/173.249.55.159/tcp/30333/p2p/12D3KooWHavNo6RUMao1sNJGWJwRyPFd4MZiv8b2UjiraR7nM7sy" \
--reserved-nodes="/ip4/213.239.213.211/tcp/30333/p2p/12D3KooWSTDwyfKATYCkdbj7j8QUxvhVZstyJSWP8dXMY59VyWAj" \
--reserved-nodes="/ip4/65.108.79.57/tcp/30333/p2p/12D3KooWN4BGTMYszFVEzSJ7fQvmuUDtZJBz7gSpkzjD447gKFDG" \
--reserved-nodes="/ip4/194.163.168.178/tcp/30333/p2p/12D3KooWL5dR7xRETRS71YEFvyAipJznTNagb1FNjraFe2LFAcdZ" \
--reserved-nodes="/ip4/95.217.212.233/tcp/30333/p2p/12D3KooWCx9VBQKtg4RhC4ef4sdkcye7nHCZwhjsbBp18PjaFTu3" \
--reserved-nodes="/ip4/132.145.31.136/tcp/30333/p2p/12D3KooWH7UUzQmrP9R5BmC8BF3NSd8qn2M8FCyhSQaseD5rdKXZ" \
--reserved-nodes="/ip4/65.108.45.91/tcp/30333/p2p/12D3KooWFH5NtfPDivYbt3QZ9tGSVic5Q3HLaK5NZxvkQCvUDBeh" \
--reserved-nodes="/ip4/176.124.220.235/tcp/30333/p2p/12D3KooWKeUZFgtZ5r6H9tnyhpmkdpi6DJB7Y2YssF7Ti3ZH6XSP" \
--reserved-nodes="/ip4/65.108.214.179/tcp/30333/p2p/12D3KooWLjgufeTuusSonYPywCkFxgbBkkZ6XnrfCjUtiM8DaeUN" \
--reserved-nodes="/ip4/135.181.60.182/tcp/30333/p2p/12D3KooWMc8p4qhdx1fc3oA8RaCdZbzpd2efmh8Ygmp3TVHH7gMN" \
--reserved-nodes="/ip4/65.108.244.29/tcp/30333/p2p/12D3KooWDFbXCuGVxfonH4f89MgQtzkwTKMBCfaZSJ9sExRpak17" \
--reserved-nodes="/ip4/95.111.228.150/tcp/30333/p2p/12D3KooWKbnEEvcDhPAmxFdpKkGUsLrsSZcxsTJmBvhdLLTBgBuE" \
--reserved-nodes="/ip4/178.18.240.163/tcp/30333/p2p/12D3KooWF5L6ib6Nn1boPTzSCp8PPXymKyz5BsPeKQCFRPVtB8w3" \
--reserved-nodes="/ip4/65.108.123.49/tcp/30333/p2p/12D3KooWE1un8yM4zPCQtMrEcqFmDHcXcdDcFrrupt21twjiZAWv" \
--reserved-nodes="/ip4/65.21.237.226/tcp/30333/p2p/12D3KooWA9Zcvg8pUBmtYjLBhvF1CQ9W25vj6cffYTqnizfMgKxa" \
--reserved-nodes="/ip4/135.181.114.84/tcp/30333/p2p/12D3KooWJYUE6ZbUQMPkWU1MESrMfcHAkWYC5WWy7Ga8YqKxVQB2" \
--reserved-nodes="/ip4/183.222.63.188/tcp/41008/p2p/12D3KooWDiUm2ddKbeZQFRC5dK4WKKyJpbkX955CFPSszJCZaUpm" \
--reserved-nodes="/ip4/161.97.73.127/tcp/30333/p2p/12D3KooWSUKidCxfDgDh37wyVoPBxB68q4BZj2dHFUpYxt61zJgE" \
--reserved-nodes="/ip4/194.147.58.80/tcp/30333/p2p/12D3KooWCytx8ppae3G7yaSmWVawum1PRdv3einP1ZQwEk4RASZU" \
--reserved-nodes="/ip4/46.4.12.50/tcp/30333/p2p/12D3KooWFmwvEyWLEhDmcUuurXiJkNfHLjoTecoKdMS6czttmPJ6" \
--reserved-nodes="/ip4/135.181.221.189/tcp/30333/p2p/12D3KooWF8Je7ocRvZ3EDVTStbbZ36sHx6ZptoTC2FCVLH2J3qE7" \
--reserved-nodes="/ip4/146.19.24.166/tcp/30333/p2p/12D3KooWPYufYtZn7K59d2zL7qgX3ZC5bGwM9Bs4FtqVyLQrJqUW" \
--reserved-nodes="/ip4/194.163.150.25/tcp/30333/p2p/12D3KooWMZBE8w7oigySrhkf8y8vShJHUyfKjmjrFuNXbuvdD1bY" \
--reserved-nodes="/ip4/38.242.210.140/tcp/30333/p2p/12D3KooWJvA1GnZgo5xcHTu4GDifzraVj2fznFWeUrEwU3bM3mJW" \
--reserved-nodes="/ip4/65.109.9.65/tcp/30333/p2p/12D3KooWN1aJUPBCcy35f8Tr1AopAGojyXoJL4K2s8NzQfUCc4Ar" \
--reserved-nodes="/ip4/135.181.94.160/tcp/30333/p2p/12D3KooWECfzrcBiCPXJMyWFnyWg5YF6VzaBaHD2a4dsutA5hLgm" \
--reserved-nodes="/ip4/65.108.47.171/tcp/30333/p2p/12D3KooWStVok4RGrj87g6BuU6LMqW2JRXE5ooMuQxj8gvHckLMF" \
--reserved-nodes="/ip4/5.9.100.178/tcp/30333/p2p/12D3KooWNSkhoka6zr6tHvKt7jSFoEhjqcu9k969XF5uwyAXmQzY" \
--reserved-nodes="/ip4/116.203.45.6/tcp/30333/p2p/12D3KooWHqUSoMrSk3KJcJ9FdgVaGP5HXvEybJ2gzgtMX5L2jAe2" \
--reserved-nodes="/ip4/38.242.209.213/tcp/30333/p2p/12D3KooWQCHHdBXfQrm4vuGGXF5qhsZu1AC72H28YpyPE9D6PwUW" \
--reserved-nodes="/ip4/65.108.137.196/tcp/30333/p2p/12D3KooWSXiEhTEovooXEiQfqu5hnpsiS9YLpB2Ms9JQTZGqU64Q" \
--reserved-nodes="/ip4/64.227.110.250/tcp/30333/p2p/12D3KooWRwLGXAFdfvAiKhHfoT6Wsw8HqF1rRE8nG9xptzZgewzV" \
--reserved-nodes="/ip4/65.108.194.40/tcp/30933/p2p/12D3KooWSjo5PYzvq3k3t6LUtvjPjvU85rskERotCEQyXjhyuAVc" \
--reserved-nodes="/ip4/65.108.46.90/tcp/30333/p2p/12D3KooWHbKRuiCpBdwbynBeaLRG6dxpNygvLQmRUcyBxARgTpKW" \
--reserved-nodes="/ip4/65.109.1.244/tcp/30333/p2p/12D3KooWPHFB1S5h19X4D8Me1smRG9GpYcu68pUpEGy413VpRRsB" \
--reserved-nodes="/ip4/65.108.100.57/tcp/30333/p2p/12D3KooWNML4QbsXPRpRHaP6EknLEHn1WuGyUdMqL68rJQSVTJqn" \
--reserved-nodes="/ip4/5.255.100.23/tcp/30333/p2p/12D3KooWLVh1uTsZAG3pmJKyHppzFctewS8suqz3ySACveCZeaYk" \
--reserved-nodes="/ip4/65.108.193.236/tcp/30333/p2p/12D3KooWCefHdVnBX9pZDeXemXk6cJBGwZW5csarCGgEPyApzXke" \
--reserved-nodes="/ip4/195.201.151.130/tcp/30333/p2p/12D3KooWL3otdeLqfvZ4fL3gqf5dLUQCay3e5WJF5dzKXPo753gc" \
--reserved-nodes="/ip4/194.147.58.76/tcp/30333/p2p/12D3KooWRY3dRkm2NecWuCrbVVxcJ4S31YvzwosxGdqyfsPx4sXw" \
--reserved-nodes="/ip4/178.63.85.230/tcp/30333/p2p/12D3KooWP9GN4xmQqW1xirsMjbYFDHw6iaTEEyY38a4W8Aq5PCV3" \
--reserved-nodes="/ip4/5.255.101.22/tcp/30333/p2p/12D3KooWEGrgukgMr27snet3N1AMRVmFYPkmsbpcbgeDcmUFPCrU" \
--reserved-nodes="/ip4/144.217.201.164/tcp/30333/p2p/12D3KooWDwRiEZWnxKUEPVxKDvJ8FJR68bSP3rkVZyEvrfmMb2a6" \
--reserved-nodes="/ip4/65.108.65.54/tcp/30333/p2p/12D3KooWAViq9dfJbjj2xrZ2oLWwq8pb9BjWjgUcs7QuKZNWLhmC" \
--reserved-nodes="/ip4/209.126.13.153/tcp/30333/p2p/12D3KooWD6AjmQpiDETtBiTbmbxjpnv3PbPUTU8236NohHRtgZU3" \
--reserved-nodes="/ip4/65.109.2.186/tcp/30333/p2p/12D3KooWGdyZNcpRBb7pQfzCBgPhRF2su269owhfhBqAVwvpnVoT" \
--reserved-nodes="/ip4/65.108.255.154/tcp/30333/p2p/12D3KooWMsTA4GrDd397aEeQciEbZ81gtDTAAFCc8AEGUQm5Jos9" \
--reserved-nodes="/ip4/146.190.232.28/tcp/30333/p2p/12D3KooWEkJYe5UyvsD966py5ttVPFK7syKmKeoMG87pp6RuJwTz" \
--reserved-nodes="/ip4/95.217.153.117/tcp/30333/p2p/12D3KooWFZaqpJh7UQr6zqGouWbrHoVVAPSBgdDffjvCMyBUb6Jn" \
--reserved-nodes="/ip4/45.10.41.20/tcp/30333/p2p/12D3KooWKvqna3vaCFffS38jcWecSGStP5QKxSuM9HjsirhZ1cjW" \
--reserved-nodes="/ip4/146.190.29.217/tcp/30333/p2p/12D3KooWSxWVpiyyoy7YzcEcpsCchMkYw9HRY6ogkG7bGfsjpnD7" \
--reserved-nodes="/ip4/38.242.247.77/tcp/30333/p2p/12D3KooWJjPXrF3wXMMvfPAF5gF3TYwTVURDg2ZE9bsihx9KtgLm" \
--reserved-nodes="/ip4/154.12.236.153/tcp/30333/p2p/12D3KooWPECLpWid37iwGWdiVEHQ3oB4yZUc8TMnhonLx7pYnVvf" \
--reserved-nodes="/ip4/38.242.200.26/tcp/30333/p2p/12D3KooWHDRJLuHd4EKpNXcw6uorueFuVR5xZTqPMd4BezkizTY6" \
--reserved-nodes="/ip4/176.122.88.128/tcp/30333/p2p/12D3KooWSRJT7eRhzFYuHuFv2ofnWdAS4S6qGdWoW4DgHirRbG9U" \
--reserved-nodes="/ip4/135.181.81.5/tcp/30333/p2p/12D3KooWD3Wn6opCxj6ZevzNbUX66bWuEQr1Zs9pMWyVNY8SS6W6" \
--reserved-nodes="/ip4/5.2.74.245/tcp/30333/p2p/12D3KooWPCDUdM58r4zex23A277QgxGzDyJwK7CuTeX7VbDKGzg3" \
--reserved-nodes="/ip4/130.61.116.43/tcp/30333/p2p/12D3KooWCf1mmM6YL4heo9qBf4xK95eY43B2H6uRWBHE7XpeDL4N" \
--reserved-nodes="/ip4/95.111.253.61/tcp/30333/p2p/12D3KooWCDXdnxF13q7pjyZEo6QUHiroFoDaiWzEfCiYiF3WgnNf" \
--reserved-nodes="/ip4/95.216.213.171/tcp/30333/p2p/12D3KooWJzb3wFzH3xvC3bPytqBqYiZqLS2NtavykPdUr2TXA2g5" \
--reserved-nodes="/ip4/49.12.98.118/tcp/30333/p2p/12D3KooWCfhbvHmTppb11DTfo4EMTS3c8VbKYsqMUXEr1iu4wtDQ" \
--reserved-nodes="/ip4/65.109.5.232/tcp/30333/p2p/12D3KooWRje5ztchMxEUiEW5L2SaMk3crRrrLT47GayFvHxiws16" \
--reserved-nodes="/ip4/89.163.214.238/tcp/30333/p2p/12D3KooWQ2ev9QAsGZ9iBkfQcMuJrq91opBbDGvC13SNc4sqJpiS" \
--reserved-nodes="/ip4/65.109.5.169/tcp/30333/p2p/12D3KooWSgKEgXHxDcBzMLaxdPJTSF2xXpKvBbRZdiUoD26XFaFM" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40708/p2p/12D3KooWGqVwBEf5X2Rz2QE2eSQkmjwjT7UQhdVzhp8es54AhUmd" \
--reserved-nodes="/ip4/142.132.180.169/tcp/30333/p2p/12D3KooWNyjMf6p1UyYfHSpfhXL2sTCNbhC23GDTDk44T9w3k2P7" \
--reserved-nodes="/ip4/138.201.195.122/tcp/30333/p2p/12D3KooWLnXyjqPvwDD16Y9gwvcBhCfwj9GF2ezc2zsk2BXG5aaY" \
--reserved-nodes="/ip4/207.180.224.176/tcp/30333/p2p/12D3KooWPfeYCSn5AQov12vjGigN3ycvbeu5T5fLiLMsWEu1zeit" \
--reserved-nodes="/ip4/65.108.98.98/tcp/30333/p2p/12D3KooWB6KwKjapnG9M2aN6FHnLLPEWf74uazFTo2AkcwT9JJjc" \
--reserved-nodes="/ip4/188.234.3.218/tcp/30333/p2p/12D3KooWS42dzYHFdRYYkxBXKYNDLHPNszsxHMPzGwKT4gt4ktUr" \
--reserved-nodes="/ip4/81.30.146.43/tcp/30333/p2p/12D3KooWFWMLtygT9e6e5fzkLc4rRxZz8LHuM3KSrfWHbpeNAiqi" \
--reserved-nodes="/ip4/194.147.58.92/tcp/30333/p2p/12D3KooWMtSxYEd3ZyXXTFT1uvuVjn3zsRYBqN4Uq85a83Xh9eA7" \
--reserved-nodes="/ip4/135.181.116.161/tcp/30333/p2p/12D3KooWCzFcw82sghSMTMNptbBWWSmePGqG63PMS7asF3Y52bHo" \
--reserved-nodes="/ip4/5.161.60.42/tcp/30333/p2p/12D3KooWP4hfeF1jtWNNojvnacne9QHT6p3WNk4frNUXpsDVqJQ1" \
--reserved-nodes="/ip4/111.9.31.176/tcp/40401/p2p/12D3KooWK2UxvCXSss9MHrQybaDvYungQuBD5pFGo39UV9LHH18y" \
--reserved-nodes="/ip4/130.185.118.170/tcp/30333/p2p/12D3KooWF9gFn52KigV8FGFe4CPghY5HSR9HcqszTCyDb1ebBF2L" \
--reserved-nodes="/ip4/5.161.59.100/tcp/30333/p2p/12D3KooWKSFiMJFYJtNXNvpRMdZ3jkobvMdyFhHwwyb557CSPwqv" \
--reserved-nodes="/ip4/159.65.23.60/tcp/30333/p2p/12D3KooWSv5iTdiZMDWhdCgP7GiGaqcnVZWFBpQBDKHZqub4ppbZ" \
--reserved-nodes="/ip4/65.108.242.183/tcp/30333/p2p/12D3KooWRxa2KrNJPtxAxDJvyEBz3EizCffbxwhjknzjasV3FgBL" \
--reserved-nodes="/ip4/49.12.190.65/tcp/30333/p2p/12D3KooWBhDNUXLNFTwyZ1KoTWCohfzomw3DKojYJLkfkFEgkUpf" \
--reserved-nodes="/ip4/89.22.230.59/tcp/30333/p2p/12D3KooWRtwietthCbNG34kRAU3Szu1J6V6KTh1gBnJo3w4rXaRU" \
--reserved-nodes="/ip4/172.104.243.50/tcp/30333/p2p/12D3KooWRcJBV2Esey7FXHtKF4kSU7dzWerLaQSpHPQQJhwsV6vh" \
--reserved-nodes="/ip4/185.190.140.165/tcp/30333/p2p/12D3KooWQvJTzjDLoc1rmzGZdBvJbeo3xxqd2GfJiz9VPbSiFYmq" \
--reserved-nodes="/ip4/183.222.63.208/tcp/40811/p2p/12D3KooWEstK4gL2xe7bXUt5BVuNaeyVpafDYrrxEnxaeDee7KAz" \
--reserved-nodes="/ip4/111.9.31.164/tcp/40411/p2p/12D3KooWCpssAbz694M2JQkj52TJtGGz7ALRqmVQn2VLKrgQmavM" \
--reserved-nodes="/ip4/49.12.247.241/tcp/30333/p2p/12D3KooWMiDdjJvtb8YdQDKSmPm7XBcteTKtZstY2W1YYYBsv3MT" \
--reserved-nodes="/ip4/51.77.157.249/tcp/30333/p2p/12D3KooWSNjovWjS8yV3eKH8ACMpkD61zqNGv7TBMAfyuoVbzd7v" \
--reserved-nodes="/ip4/185.209.229.33/tcp/30333/p2p/12D3KooWDz7niAzRvxYWEceTx6bvDmRqXwJSRKQwUKrTZs8VggJ8" \
--reserved-nodes="/ip4/38.242.244.199/tcp/30333/p2p/12D3KooWSa69WwGuiCHMzvVrt4RkGesiCTzmNNbwj4VFGygApdkR" \
--reserved-nodes="/ip4/65.21.226.230/tcp/30333/p2p/12D3KooWKMSHzutNJNyKJ9gjjyJyt5HWfpZM1GaNwBRXUudPoHv1" \
--reserved-nodes="/ip4/195.2.74.62/tcp/30333/p2p/12D3KooWFbExYC5p3EyHkdfa8nPYaX8Pw9cbeTjZ5RbYG2AT6Dvs" \
--reserved-nodes="/ip4/144.91.114.41/tcp/30333/p2p/12D3KooWMAkEGkh7Qw9LcpNgrTbpaSi4JCTntjGivwDBrjS3Ge9M" \
--reserved-nodes="/ip4/194.163.155.133/tcp/30333/p2p/12D3KooWHfBfPQps4kbXbgdQ5anxKQXoUFdsN3UNNXb4iwftjTgp" \
--reserved-nodes="/ip4/62.171.190.20/tcp/30333/p2p/12D3KooWHGXokXbwzuED9nLNPgrY4MsMtmffH84kpNj8s136pAEn" \
--reserved-nodes="/ip4/207.180.230.85/tcp/30333/p2p/12D3KooWEGhAzdTCxAwfkMejCmSTMMzz18rkhZNntLqPjrmnKjo5" \
--reserved-nodes="/ip4/144.91.78.25/tcp/30333/p2p/12D3KooWF3MeJcYUaY37WcpNhkaQxSfbwoa5haBWfyYNjrjF7Cdd" \
--reserved-nodes="/ip4/135.181.146.246/tcp/30333/p2p/12D3KooWMF2BDxVNR1sMDkZ2ZBu9nAPXFqokLXqqAfrMU4Y6tkRz" \
--reserved-nodes="/ip4/149.102.159.73/tcp/30333/p2p/12D3KooWMNUxMXS1MJi82Dcg9rtCc9AdpQELKPjmVFGN2E4aWUvR" \
--reserved-nodes="/ip4/65.108.250.110/tcp/30333/p2p/12D3KooWGKB4CWY2SMwArAW9JskobLsV3dj83NR2mdTV152XKSsn" \
--reserved-nodes="/ip4/65.108.129.132/tcp/30333/p2p/12D3KooWRaLaHsVVShFaTRTxCcYuKFzkCXi4EyMkYTL1EAi3Hqp5" \
--reserved-nodes="/ip4/23.88.65.34/tcp/30333/p2p/12D3KooWK4mrrg1wcR4iFhyhiPhkd498y8qcrtZYC5oETATimFYF" \
--reserved-nodes="/ip4/5.9.105.94/tcp/30333/p2p/12D3KooWHijmz5hqnMVDsXHx2CXPrcgY3pNwhrekyY5wjC1S5iwF" \
--reserved-nodes="/ip4/65.108.211.189/tcp/30333/p2p/12D3KooWHqHujqV9Ys6KTKxsoX5ANSTnMFnATiqrUXV7TRket3nG" \
--reserved-nodes="/ip4/5.161.140.60/tcp/30333/p2p/12D3KooWQVpgedCHEo4UvbjFs9Ps9kYU5DB5naT4b5sLqAxURXce" \
--reserved-nodes="/ip4/65.109.15.180/tcp/30333/p2p/12D3KooWAqkLUFS2w2f3owpk5NZNXyE5c6knLqHqC7dM9gz8ySu6" \
--reserved-nodes="/ip4/45.151.123.119/tcp/30333/p2p/12D3KooWQpv9oejroQAy1E7wF7FiCG4Sd82dsCMf2VndAstgRDND" \
--reserved-nodes="/ip4/207.180.227.81/tcp/30333/p2p/12D3KooWSCtA5grA8xatcvo3tiAiGagxfH4iBBYGRGU93ayba4Ac" \
--reserved-nodes="/ip4/185.255.131.30/tcp/30333/p2p/12D3KooWHEWHZR4kLbKKvDnaFKfXKgHWNkLu3874KWc1yAFmWMsw" \
--reserved-nodes="/ip4/117.173.218.208/tcp/40609/p2p/12D3KooWKuPwQwDLsVbH8WifPGSDGcg6S3rBr3CbCDg3kBZ6QJJn" \
--reserved-nodes="/ip4/159.223.118.37/tcp/30333/p2p/12D3KooWKHvkyYSo9LLvBp2DtBk8KF8aaZbUiK2yXXAtzWb2e9LW" \
--reserved-nodes="/ip4/95.216.187.217/tcp/30333/p2p/12D3KooWGA5GzksZdPTQLnHbX5V2GCrqcznYkiQ7tVuGtSHSEH93" \
--reserved-nodes="/ip4/5.255.100.8/tcp/30333/p2p/12D3KooWJ99SQkt1e3DVTjABnpYuBnBXXpqZFPVa9TqRkmbFfupQ" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40711/p2p/12D3KooWNJJPZjQMVQCsgm6jLAdhNW7QG19k6HNfzvmgcCs1ddzn" \
--reserved-nodes="/ip4/144.91.83.122/tcp/30333/p2p/12D3KooWDXaFcLHWpDXMicMXy3Z61VRmJ3V576GhuuUygwkojPjV" \
--reserved-nodes="/ip4/5.161.84.157/tcp/30333/p2p/12D3KooWHM2ortxhEYvxAqM8WFCf1XCbjfMRJ2GspLpwaesZxZpk" \
--reserved-nodes="/ip4/65.21.177.203/tcp/30333/p2p/12D3KooWDDiXzuLmEeUUdJ9n3a76cZY338YMWuyYwcxYPdxwtZ1A" \
--reserved-nodes="/ip4/65.108.245.203/tcp/30333/p2p/12D3KooWRXSMtjMNieNoHp5BTLPMKmzzZBP1t6Rus2ewEpEQmLGs" \
--reserved-nodes="/ip4/183.222.63.208/tcp/40810/p2p/12D3KooWBLuuMsgMTuVdpCdbrRU5i74LpqipNt85NihzcHAKxPyV" \
--reserved-nodes="/ip4/144.76.93.136/tcp/30333/p2p/12D3KooWJcZvoEtibuXjFiKyR9HDVWcd8dFdSuC1xLQ6wXHJhwVA" \
--reserved-nodes="/ip4/161.97.173.234/tcp/30333/p2p/12D3KooWS3m9EoWYVmcqWDYjZLGBaLHnomV7Y6quzfqpcNQZE7mB" \
--reserved-nodes="/ip4/146.19.24.207/tcp/30333/p2p/12D3KooWFPjqTV6pbWL37rKJWmAb7XCA7iCykKdVmYitf8RGJcpL" \
--reserved-nodes="/ip4/194.34.232.89/tcp/30333/p2p/12D3KooWAzKpr9jYJNC9k3no6VSkXravVSfhVA1ZFrZN8khs4xRN" \
--reserved-nodes="/ip4/65.108.44.100/tcp/30333/p2p/12D3KooWNbmyc4hJDRmqov7k2x1DkLhx7t5EwyAkUN4MLe5eKsp4" \
--reserved-nodes="/ip4/49.12.193.205/tcp/30333/p2p/12D3KooWDSfqfpq5aPgtxJ4somiFZ5bDFKue873mFdng4WNU9fbJ" \
--reserved-nodes="/ip4/38.242.199.255/tcp/30333/p2p/12D3KooWFaUW1u4F1Gr4ppTsai89xj8XUvyLyd9z31wWScifc1h4" \
--reserved-nodes="/ip4/65.108.65.250/tcp/30333/p2p/12D3KooWCoBMHrEg3KsYbBmSMLjup5zWFGjn222SNNfPzNff3KcX" \
--reserved-nodes="/ip4/192.34.56.129/tcp/30333/p2p/12D3KooWF9CgB8bDvWCvzPPZrWG3awjhS7gPFu7MzNPkF9F9xWwc" \
--reserved-nodes="/ip4/135.181.108.245/tcp/30333/p2p/12D3KooWEwWyZijCmpQQe71s81ePuH1CiNp51JNZeijCVqH6MEK1" \
--reserved-nodes="/ip4/116.202.131.182/tcp/30333/p2p/12D3KooWHKmmhC4B6xRzaRg1NppLGNutigsviny6VQ7fXQGYGgAM" \
--reserved-nodes="/ip4/135.181.34.4/tcp/30333/p2p/12D3KooWHZ8zfeFkk8w9jzQyDafydc4Ujjip3g1NgjkYxQYdSvNE" \
--reserved-nodes="/ip4/157.90.2.112/tcp/30333/p2p/12D3KooWH1WLP2NPcSFGxntimWNyEC1Uo2gjwkYMmZBixnzTUavt" \
--reserved-nodes="/ip4/65.108.193.176/tcp/30333/p2p/12D3KooW9zJGKai5Ryi91YDaASQ342oLPsxeimWp92QTwW2GYCXu" \
--reserved-nodes="/ip4/95.216.185.20/tcp/30333/p2p/12D3KooWDD4ygXM5rKMK5HoYSAcxwfboavtby1XXpDFScfwqX7VC" \
--reserved-nodes="/ip4/178.62.26.171/tcp/30333/p2p/12D3KooWFNtSNKqwEB1y1QYvvEZbySVpALpyvCu9y93ukKJhYw1m" \
--reserved-nodes="/ip4/88.99.214.31/tcp/30333/p2p/12D3KooWCQDy2L3sWgKwuk4GQ1r2NFoDmXycRFZHQKKYb4LYrKXe" \
--reserved-nodes="/ip4/95.216.185.25/tcp/30333/p2p/12D3KooWEFBy6nvFxoSFgVLJ7f9zi28ER6EKgkKEfxnALEvuJCnV" \
--reserved-nodes="/ip4/167.86.118.86/tcp/30333/p2p/12D3KooWR8rLEW7TDjfZhdnCdpv9fgQHvcHTpTH786X2sQ93QEQy" \
--reserved-nodes="/ip4/35.209.90.185/tcp/30333/p2p/12D3KooWR9vodt8UeHzTKz92qZzoA3AszMXyLnmVbwQYR2vQydZ9" \
--reserved-nodes="/ip4/207.180.220.95/tcp/30333/p2p/12D3KooWDwQfjLdzNageSPyaKHgY7JW5tZz1zZm5uVxzwZQpskJG" \
--reserved-nodes="/ip4/65.108.213.203/tcp/30333/p2p/12D3KooWJ61LxKBmRqinsCdbHDWDd3Qcw1dDhS5uzf6bLL5oCrmJ" \
--reserved-nodes="/ip4/135.181.111.81/tcp/30333/p2p/12D3KooWPioe58hiD8eMXvt2eaTvp35jQhZtLoXEpEE7CLS8FE7n" \
--reserved-nodes="/ip4/185.218.124.178/tcp/30333/p2p/12D3KooWNxJnuR64bPwa5C1JN4prFAToP52Kb1JxWCkbcKnFQsuD" \
--reserved-nodes="/ip4/167.235.242.74/tcp/30333/p2p/12D3KooWJDASZjFDHAvVNNxE6ae3c2bc66mHa6ZiCZFZr3LiYin7" \
--reserved-nodes="/ip4/142.132.223.123/tcp/30333/p2p/12D3KooWFEp57RwU5S6oduLhzcbi2epA5HDab5mBFRCnaeT2fxgq" \
--reserved-nodes="/ip4/65.108.206.74/tcp/30333/p2p/12D3KooWM4cMR9LfjgcTmNN4886k8GZRHvwGBNrSVbu7zj8HGmWh" \
--reserved-nodes="/ip4/161.97.179.117/tcp/30333/p2p/12D3KooWKby1vZPGLD971B7hN3P5p4iMT2CsJJTtvuddtiy7oRzP" \
--reserved-nodes="/ip4/117.174.25.129/tcp/40803/p2p/12D3KooWMAhhE8rV4kdBJd6cYthmqSnJ1yemHnad7QcXPhP8NimP" \
--reserved-nodes="/ip4/95.216.159.0/tcp/30333/p2p/12D3KooWPVzzbB9UstJs2m9mUwb9dfTvGq6KcozZo1sNYbVTQnAL" \
--reserved-nodes="/ip4/95.217.211.32/tcp/30333/p2p/12D3KooWS17DweqMu8t31X7sQdVbuQApDFawp6fnHjjfdMFeGvTj" \
--reserved-nodes="/ip4/38.242.205.0/tcp/30333/p2p/12D3KooWDWn8d43tr2EdEkbc9AXgb69esowfgaeSADC3A4GWsB2a" \
--reserved-nodes="/ip4/62.171.184.58/tcp/30333/p2p/12D3KooWQx2Jfy3F1eXS28MSEbjWnL52NBF26oAVzuWPnysQCdjF" \
--reserved-nodes="/ip4/65.108.1.219/tcp/30333/p2p/12D3KooWNbBTFr52qCGWHtDnQVYhLoDifQS1YmXt73Dut1EMpGoM" \
--reserved-nodes="/ip4/142.132.223.67/tcp/30333/p2p/12D3KooWJZnELuGh7MAci7TF9rPgHZiK1gsVvSyCBeeK9GMHAjG7" \
--reserved-nodes="/ip4/194.60.201.223/tcp/30333/p2p/12D3KooWFowmTCLUKmxWd38sLx6QU5NQ4UwyrVRDJdFN3X8jcRAa" \
--reserved-nodes="/ip4/185.182.184.230/tcp/30333/p2p/12D3KooWQeCc3cygH6xkz4GzyyijJJjY8ubNxuof98WYHbBS6zRY" \
--reserved-nodes="/ip4/65.21.248.220/tcp/30333/p2p/12D3KooWRJGtiNVXR1gy1eqcbFGN6NxSrFr2tt4qmvVXVY5G9Qvd" \
--reserved-nodes="/ip4/95.217.228.231/tcp/30333/p2p/12D3KooWD7ktkjG53xGS59KHzsCjR7WCuXe7QnpR2Zu3Nr1G4XdJ" \
--reserved-nodes="/ip4/144.91.122.219/tcp/30333/p2p/12D3KooWL6L55cvUPy17d2Pk3o2FZKcsxov4RLF43FtcVeirPYYP" \
--reserved-nodes="/ip4/65.108.193.175/tcp/30333/p2p/12D3KooWPxGXQN1qStkqt3HKZVvccx1Bb4SyYHw1hDWUuxHcfhX3" \
--reserved-nodes="/ip4/65.108.138.93/tcp/30333/p2p/12D3KooWMZPH82NVVP4vodbNW1ycxnXxVp5PmAUVFZC8f92YTqQT" \
--reserved-nodes="/ip4/146.19.24.64/tcp/30333/p2p/12D3KooWAteztJSqBW4JiUBmKiM7JcLpLz8SMEJPo3Z9TqtcZ7C3" \
--reserved-nodes="/ip4/62.171.190.43/tcp/30333/p2p/12D3KooWK1xckLUzeBsoE6nvrY8BNykyNiTKQQxqWWpqSTbeB7cU" \
--reserved-nodes="/ip4/111.9.31.164/tcp/40407/p2p/12D3KooWQxGMXp1E1v842r7f9HxMD71ZpytJHGGEFf8g4R9XeosX" \
--reserved-nodes="/ip4/65.108.85.88/tcp/30333/p2p/12D3KooWBZeRQLDyJ9RfowFjEWxEjJXZw6ic73hxtNqDzWcgc2yX" \
--reserved-nodes="/ip4/84.39.241.20/tcp/30333/p2p/12D3KooWMP9HLVyjg3pNkRF2vPJDBPSi3ojTKCzjrPVr7f496eBN" \
--reserved-nodes="/ip4/38.242.220.172/tcp/30333/p2p/12D3KooWKvCkzu7jLMJubaHnghbTeqBtxzWY8zcD8f6c32Xo5bxz" \
--reserved-nodes="/ip4/213.202.252.222/tcp/30333/p2p/12D3KooWJdP7NuUEoKJbVS81XmvK5AYH9WWfJAQmiUvuuRftv45y" \
--reserved-nodes="/ip4/91.240.84.231/tcp/30333/p2p/12D3KooWKckkoETSxmHR7FA8kovYhgDaaLr59ACJmNCqs7iD5LWS" \
--reserved-nodes="/ip4/49.12.245.124/tcp/30333/p2p/12D3KooWALhQ1mXbEbEDfX3xbZR56MvjvBvto7X33tAaoHP6pokL" \
--reserved-nodes="/ip4/65.108.67.152/tcp/30333/p2p/12D3KooWMkjWoKsor6vwVC4sLpD1VZtVxrfsJb2EUcWVtGXFkN4z" \
--reserved-nodes="/ip4/38.242.200.28/tcp/30333/p2p/12D3KooWFHkjtZnpuVqMCnriiD7ptsc28114Anydojgx6dwrED4t" \
--reserved-nodes="/ip4/135.181.95.157/tcp/30333/p2p/12D3KooWHpTSbBbdqrbbWBeKyyEqDkkKw5HevdHHAZ5iyKDmBwSa" \
--reserved-nodes="/ip4/136.243.0.168/tcp/30333/p2p/12D3KooWPprkhs4nD9wsbNEnAH22vTsqtEjHbKMdkFtULk4f5kBt" \
--reserved-nodes="/ip4/66.94.96.229/tcp/30333/p2p/12D3KooWCgnRFFVibFKSdzzt13XVAuwYXaR6sHWW5vPLv6yHaPBL" \
--reserved-nodes="/ip4/89.22.229.252/tcp/30333/p2p/12D3KooWGzwn46AfVhEUAy5JGm7dTZE4zmAphtUv1iscWviMwy7o" \
--reserved-nodes="/ip4/5.167.168.125/tcp/30333/p2p/12D3KooWLVUnKTfDQFK3J8ivnuADU9q4ZVLgCQ1oDik8TtgAnaH9" \
--reserved-nodes="/ip4/111.9.31.185/tcp/40311/p2p/12D3KooWLKCnbyJGbPxmA5nNcvGX1ehA6oSSJB2gUgHF1AHgYb7h" \
--reserved-nodes="/ip4/95.111.249.207/tcp/30333/p2p/12D3KooWQQm3cJSf48LXVSbnma6xTidwJEHLugisjL8etrdFtme4" \
--reserved-nodes="/ip4/65.109.1.57/tcp/30333/p2p/12D3KooWDMU3dnXjZhU33yZGab2WR7E5XJRuNdoKzGtfbUZtZejw" \
--reserved-nodes="/ip4/66.94.122.224/tcp/30333/p2p/12D3KooWMFxax7PTtZCvjWRSRgqeMpgyYD3TwZtcUMWttRUVauer" \
--reserved-nodes="/ip4/65.108.3.174/tcp/30333/p2p/12D3KooWH2tBcDsFuanU5tdnJfKbbRtYRRk4kbn6JHGWmPWKFrgJ" \
--reserved-nodes="/ip4/185.215.165.61/tcp/30333/p2p/12D3KooWMnM2gGKxJx9qcVjaiNnCjcrx94MSHyfSRhCEuEtqkVex" \
--reserved-nodes="/ip4/65.108.106.169/tcp/30333/p2p/12D3KooWMx18Wu8roE25WziQ7SQFnnsU7Q3cn3FNsUq6g8PVkPVo" \
--reserved-nodes="/ip4/65.108.228.84/tcp/30333/p2p/12D3KooWHs8Z7LqutNY5xnw3ZqhEZh7sa9m1zU26eEhEm85eo2JA" \
--reserved-nodes="/ip4/66.94.118.58/tcp/30333/p2p/12D3KooWM3S8fVTGowpjp7CrCa7ygUTLGtbYpYmB4EEFZ1UQjCY6" \
--reserved-nodes="/ip4/117.173.218.208/tcp/40600/p2p/12D3KooWAUDiH5WqETHmYi9aLNNCp8dJxtFd2eTMLbBJ4m4Y9RwL" \
--reserved-nodes="/ip4/95.111.239.159/tcp/30333/p2p/12D3KooWCLiLmZYHiazUbeqCUKD3Lr59253C69VmaibgZs58d91s" \
--reserved-nodes="/ip4/185.231.153.190/tcp/30333/p2p/12D3KooWKEb9BVzezqudCkLGHGpVCEEuf69wKTKyXs5tqzrtBcjy" \
--reserved-nodes="/ip4/5.255.100.44/tcp/30333/p2p/12D3KooWBSafzysW2ZjVcBnb6NjonBZCbpW9EQfMKv3Ju64EVzTS" \
--reserved-nodes="/ip4/65.108.136.42/tcp/30333/p2p/12D3KooWGYVnE11TEs8rciZYB6FENWD9iN8AS9zebQG2V3yfBQ7N" \
--reserved-nodes="/ip4/207.180.227.56/tcp/30333/p2p/12D3KooWMPp2RVeUonSBbPLgeNj3H5B2h7AeR4XHGnkgyXByJPqz" \
--reserved-nodes="/ip4/149.102.158.237/tcp/30333/p2p/12D3KooWBvq4w6LrG2B6tYQZc241xVhSSokQeqbQqgbUYWzTqpru" \
--reserved-nodes="/ip4/185.209.228.147/tcp/30333/p2p/12D3KooWSNJTMtQf5L3ZguWxx4Y72hyMFwuZVc6udv3j2SE222wy" \
--reserved-nodes="/ip4/65.108.255.155/tcp/30333/p2p/12D3KooWQwGNUq4TbGBUJXZJKpftTsy1YQtKAZJkVWtfLCF35ww8" \
--reserved-nodes="/ip4/46.227.70.212/tcp/30333/p2p/12D3KooWNoCYWGcgyhWcKm6vCBHjb2NT5XogWd7t9pp7pPVKkvWb" \
--reserved-nodes="/ip4/38.242.202.142/tcp/30333/p2p/12D3KooWReUz325D5Bnz4d4nmMvzKMMoMxTPbjbbn3QuATDrAGba" \
--reserved-nodes="/ip4/77.232.42.26/tcp/30333/p2p/12D3KooWFPGRHmC4LBvicckd6cFtqHcE7DDmGMWwArLnF8s9bkFb" \
--reserved-nodes="/ip4/65.108.42.151/tcp/30333/p2p/12D3KooWC3Qzt9xYxsDkaWkrwEEasSF4VWqvNCAxiEZjNerZPo28" \
--reserved-nodes="/ip4/38.242.218.195/tcp/30333/p2p/12D3KooWRnzmtsbsaATygH9zSdqEuQV6R5gojGuNWvFBnhPLdFyg" \
--reserved-nodes="/ip4/38.242.199.215/tcp/30333/p2p/12D3KooWHZYwKvyMeFGCEemuKm7yPB1AdvQTWKPz2R3zjKs9BxwV" \
--reserved-nodes="/ip4/185.197.194.93/tcp/30333/p2p/12D3KooWCUWyVrzsh7BQkgimwWWJrQGfnXptkWsJJUhdGjEG2X8q" \
--reserved-nodes="/ip4/95.217.64.248/tcp/30333/p2p/12D3KooWRi1phVH668RDwUAUcqcPfTuWTD9WHt9W6BN89udyFRR6" \
--reserved-nodes="/ip4/65.109.7.106/tcp/30333/p2p/12D3KooWALNu42dTLyQb69SAhy2WTrHYAj78MWNsu6w2ot5teD9h" \
--reserved-nodes="/ip4/77.232.41.37/tcp/30333/p2p/12D3KooWHx4NdxKDqR63UqgXGbBqWSWegEvhdWKbYb7nBmUR6wmP" \
--reserved-nodes="/ip4/149.102.149.67/tcp/30333/p2p/12D3KooWNYkXd9nH2jMiDTjfRu9MrxEjKxeGnbcFHuExSYAQ17Nx" \
--reserved-nodes="/ip4/5.255.101.232/tcp/30333/p2p/12D3KooWHyP1KWN2DG1pgrEsPptzHRNQPXMVAEg2k6g63demsxUv" \
--reserved-nodes="/ip4/23.88.71.178/tcp/30333/p2p/12D3KooWS7HqK2hSAcbdV95tkQqGYk1Nz4NxKiTukBaJQagDKFeh" \
--reserved-nodes="/ip4/65.108.135.163/tcp/30333/p2p/12D3KooWBeijscm8pNi2AMmxysfNnwpgoydc6Hemw5DjVfxD791j" \
--reserved-nodes="/ip4/142.132.223.124/tcp/30333/p2p/12D3KooWAjorzC5Jt1m4NzXVFkM3p4ykmx5Abfd9M65dk5sA4Bwm" \
--reserved-nodes="/ip4/136.243.16.53/tcp/30333/p2p/12D3KooWK6SVV3uwm5DSfmPjaq1twfaAbuUjpnLkaVXfQmoQJZXG" \
--reserved-nodes="/ip4/183.222.174.74/tcp/40602/p2p/12D3KooWFQ3t76XGtbugrvdZpqqW1cwQY8ymWYXSH5X63g1tQDJt" \
--reserved-nodes="/ip4/149.102.149.70/tcp/30333/p2p/12D3KooWJBWSQW2LjMRxoLWDQqkD1KsSRyETPGyUhagRaByYCAEE" \
--reserved-nodes="/ip4/65.108.210.29/tcp/30333/p2p/12D3KooWKQn9kFTw4XwuewKDYfCohHiP7gb7xv2XUWC95tCpt3ha" \
--reserved-nodes="/ip4/5.161.48.213/tcp/30333/p2p/12D3KooWQZZh6b8iGiRcqAHCXwMHW4z88aBWDAWTXLATWPS1UGHn" \
--reserved-nodes="/ip4/164.92.120.47/tcp/30333/p2p/12D3KooWNgqLLKtJm1LAPF6akAzdiDQY8XGff6DBgT5B3uGNaBtu" \
--reserved-nodes="/ip4/139.162.166.233/tcp/30333/p2p/12D3KooWHpcSjt22fo4ZqBZtRoBHfS1ttsfpeyeTDtD6ZSyqpT6N" \
--reserved-nodes="/ip4/178.79.187.98/tcp/30333/p2p/12D3KooWFDWC8LWYQ683KkSUqM9Tfw63mZQnHphTooxgyeAVE3Rb" \
--reserved-nodes="/ip4/94.130.10.43/tcp/30333/p2p/12D3KooWKGEYbwfLPBvaxQc42EixZZbEECocoRhXsn94bjruTdST" \
--reserved-nodes="/ip4/38.242.202.103/tcp/30333/p2p/12D3KooWC4SAtk42qP1TM25MvrhhVGjs56Aw11TASFmVMnJ5UH6E" \
--reserved-nodes="/ip4/168.119.15.249/tcp/30333/p2p/12D3KooWEHJvJMFVFSS2jzAnWFKtZAShVbSW18m34PkUB7MnktHz" \
--reserved-nodes="/ip4/95.211.134.243/tcp/30333/p2p/12D3KooWNGaaT676u9FrvKwHivLcb8sXLurMHgBeDuUa2jfafMM2" \
--reserved-nodes="/ip4/164.68.117.201/tcp/30333/p2p/12D3KooWAkoCbqffmnY8D1qkWwGL2vNtapzz3qeNY5qkbWy3XVzs" \
--reserved-nodes="/ip4/164.68.96.120/tcp/30333/p2p/12D3KooWR7UyfwVYe3RihHS2RCE2kmtd1jSE8T47VeWYRrzacW4e" \
--reserved-nodes="/ip4/75.119.150.30/tcp/30333/p2p/12D3KooWPZFqQQQRCw9mjNa7ubk3sQfyjFYA1CFKyhM2oMVFL5si" \
--reserved-nodes="/ip4/65.109.8.85/tcp/30333/p2p/12D3KooWJZVcEQM8LAbS3WtnmYMw3tx9VWGZZjLYuZtdRYg1zLPS" \
--reserved-nodes="/ip4/185.187.169.199/tcp/30333/p2p/12D3KooWQ3LTghURga6LTViaTvzHcP6gKaxLUPuHFsAmAGyDAMri" \
--reserved-nodes="/ip4/65.109.14.78/tcp/30333/p2p/12D3KooWBpvfhdv8CX14jdbF7c4cScR1uFNN3GWp1DGf3womFk4i" \
--reserved-nodes="/ip4/185.252.233.246/tcp/30333/p2p/12D3KooWJC75Gfjui2tX8JWsHeM7ShG924ordi7etUPKGPCPckeW" \
--reserved-nodes="/ip4/135.181.180.61/tcp/30333/p2p/12D3KooWQzyeCoNa89UJ7sJkuXr9P2fcQkzvSSHVm9ZZESgezSmW" \
--reserved-nodes="/ip4/95.111.254.191/tcp/30333/p2p/12D3KooWBjzYB9pjPUcvxGqwBmPrHRfcyqfyg91Ccks5zSqtBDCo" \
--reserved-nodes="/ip4/65.109.10.218/tcp/30333/p2p/12D3KooWBA8LgMG4gdkDmWA2k3PNY2nZhGzhpJk5fgfgXZtDtw96" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40703/p2p/12D3KooWGTgMZjQwEuWiQv2MqY8caeRLKyr749UjC51r35cfCm7g" \
--reserved-nodes="/ip4/65.108.219.112/tcp/30333/p2p/12D3KooWB4KtEvP7rHhazJPNMrfxn3ZJg74Z5V4S2T7TfK4m3z2W" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40706/p2p/12D3KooWCgcJFFsnuc4RxM6RuTdDQzwW8Xs1wdLnPQjwW3M2L822" \
--reserved-nodes="/ip4/38.242.255.200/tcp/30333/p2p/12D3KooWNtpAmuEYjgNgcqDRNCbQy7xfcDFHHztHXoqV1TCHTTBx" \
--reserved-nodes="/ip4/185.208.206.59/tcp/30333/p2p/12D3KooWM95fBrB7CvsfsTZyGDbhwpat1cHiPh4xWBzAwQ23Hji8" \
--reserved-nodes="/ip4/38.242.248.77/tcp/30333/p2p/12D3KooWAsCpxTHzHqXcY3VvELL7CdAJWr2PhBns21GkyjnHLGzg" \
--reserved-nodes="/ip4/38.242.206.169/tcp/30333/p2p/12D3KooWRWcBLwYREjXZVBUmXGVqtM7auu9t2Csb8URy6eeYBxu7" \
--reserved-nodes="/ip4/164.68.120.49/tcp/30333/p2p/12D3KooWLrxUEWM7vp25coqpeDjEV5MukTx5ByBHG2um4P2wRKN8" \
--reserved-nodes="/ip4/136.243.40.38/tcp/30333/p2p/12D3KooWCZ3CMAvHaphtDAucrJbKKSFz3CujcaXjsk1vUrD5AbCM" \
--reserved-nodes="/ip4/75.119.145.97/tcp/30333/p2p/12D3KooWJFNSsGBqHEXKErZq1QN1ehEo9AvxYKRFKT7coXwZTNrS" \
--reserved-nodes="/ip4/5.161.86.214/tcp/30333/p2p/12D3KooWNaVgSjZiUTeiejCeCRMHPaT8jLLvxT54sjC3mdA1EWT3" \
--reserved-nodes="/ip4/185.249.225.252/tcp/30333/p2p/12D3KooWK8tad7u8cPom8q2Qzie5CSfkXBY6797avCWyoTB4ss6S" \
--reserved-nodes="/ip4/65.108.44.149/tcp/30333/p2p/12D3KooWDy6QDd7HizARfqxazmESwxkv4kFAoyKZrfnZFhiHpYFB" \
--reserved-nodes="/ip4/65.108.245.31/tcp/30333/p2p/12D3KooWHENkbiEyMsVxCmBNiECvSKKBojtyD8S5jqgEP5tMwbs3" \
--reserved-nodes="/ip4/65.108.134.208/tcp/30333/p2p/12D3KooWRVYLBgzRubZSxGJTd1mZCo87R4JSTrHtXFirtppbFngW" \
--reserved-nodes="/ip4/195.2.74.181/tcp/30333/p2p/12D3KooWDDkHaGhPhTCQuxCK7YbhPbKC5Cz8YDccpZm4WsZfPjGM" \
--reserved-nodes="/ip4/65.109.10.225/tcp/30333/p2p/12D3KooWPeUqbDNo6UjJ2Q4p8k8AJwCKsRZKQ5PGgeeLYJUbVYbu" \
--reserved-nodes="/ip4/65.108.10.238/tcp/30333/p2p/12D3KooWB465DhrH1g4aprvHmSD56CgFD5FXXYN21Hg2bdkjhNKT" \
--reserved-nodes="/ip4/38.242.216.201/tcp/30333/p2p/12D3KooWMdYrZGmRZA2pEceX1VZoFtGudaCZ3E6koZkfH3vo8gCR" \
--reserved-nodes="/ip4/49.12.190.76/tcp/30333/p2p/12D3KooWPbdBkjHkrq5jRJvSS8L66U69aZ4iZVq8vPGBxe68u4vs" \
--reserved-nodes="/ip4/161.97.78.47/tcp/30333/p2p/12D3KooWR89RxKKfmYj8rEHgvoyXyXK3daCyTNU3ii8c8NxBRGMU" \
--reserved-nodes="/ip4/109.107.189.224/tcp/30333/p2p/12D3KooWDNUuL5Sjr288VrTo17MfRkP8TdKB24g1x8jEGVYEFati" \
--reserved-nodes="/ip4/65.109.3.33/tcp/30333/p2p/12D3KooWE6dxS2GqCyqQNM5Hqmxf4mw3JkeE1zmBcnYAYW8JWZx2" \
--reserved-nodes="/ip4/195.201.238.161/tcp/30333/p2p/12D3KooWE9NChAjvJ4c9q46v6L7zNc9pFMxQzLb8D7Ukyi36eSLt" \
--reserved-nodes="/ip4/161.97.173.61/tcp/30333/p2p/12D3KooWJMHJ9GBE8XZab1zpinBHHHivZfWsj3gXghKAD1HBUBwu" \
--reserved-nodes="/ip4/65.108.193.238/tcp/30333/p2p/12D3KooWJdk6bRL7YpsLPSQxA75kPLGRciAuG95ETCT8YAZddhKj" \
--reserved-nodes="/ip4/88.218.170.197/tcp/30333/p2p/12D3KooWNdqUFoRuhEBbYN7m6bx8JckUQDs3op96XsE7YoPFaCVk" \
--reserved-nodes="/ip4/5.9.97.168/tcp/12230/p2p/12D3KooWPYZxjJ4FJmR16kq2VBDoo3aXbNAChm9V2fseT5jdcts9" \
--reserved-nodes="/ip4/162.55.50.101/tcp/30333/p2p/12D3KooWKv87u5sbWkz8qT4ZWSZHjt9rbZ5UHWrWQc7vEafNzQEQ" \
--reserved-nodes="/ip4/157.90.215.50/tcp/30333/p2p/12D3KooWPjeQwuFGCmffFrVfc5fhMNESEJ4bywxpyLfqFpra7QGr" \
--reserved-nodes="/ip4/212.109.195.216/tcp/30333/p2p/12D3KooWHpkZaitxfLtdeNaFREgHim1wHtaKewWfRCooor6MGuLx" \
--reserved-nodes="/ip4/65.108.101.18/tcp/30333/p2p/12D3KooWKDCqCqjjQAEiHwmRPfSq6pL2SkEX7uhTAofk4kQhmqLk" \
--reserved-nodes="/ip4/135.181.220.190/tcp/30333/p2p/12D3KooWJW3LVYeTcHc2DXRzCrYsmy7vRcUUrdHSDfcf5DFiFKuh" \
--reserved-nodes="/ip4/65.21.224.189/tcp/30333/p2p/12D3KooWMGWMaQYK6jqRimT8YrmyiTQy1JCsJMPvMXHcqvBayZgr" \
--reserved-nodes="/ip4/162.55.38.124/tcp/30333/p2p/12D3KooWNAQgaLT3uGJnDZbA1mXGJGeFG4YVrue2ibQ9WRwTmoAa" \
--reserved-nodes="/ip4/65.108.66.102/tcp/30333/p2p/12D3KooWAPqHF5HxUGNqWsLixfKfJzfEdQhheM6gfyxR3FPrzLQJ" \
--reserved-nodes="/ip4/217.62.233.157/tcp/30333/p2p/12D3KooWFLij3YzvMPqDV1Uv2Les6C4rFHDgsvjqCbw7Att2utPw" \
--reserved-nodes="/ip4/38.242.210.141/tcp/30333/p2p/12D3KooWQdTRBR4XBoKT9UdJhmzWgrGQWnJ7KK3BcJHFLNJEkLeU" \
--reserved-nodes="/ip4/185.202.236.63/tcp/30333/p2p/12D3KooWNcsp1GNGXzAY3TgvePwgdYvW98sYfCnBZhF2iVaXwXcQ" \
--reserved-nodes="/ip4/135.181.92.159/tcp/30333/p2p/12D3KooWMJUWTnmmHVoakcS89tWivVhZSP2swpAcuqsEzNXVGqBs" \
--reserved-nodes="/ip4/65.108.9.164/tcp/30333/p2p/12D3KooWFPJFDYYDWAorBsGafJLTvsUoaj17i4LekknafteHpuZb" \
--reserved-nodes="/ip4/117.174.25.137/tcp/40301/p2p/12D3KooWF3bPZ33Ue8KfesLgFMvUERdy3PZTTV48WURLFYSptyDL" \
--reserved-nodes="/ip4/95.217.211.139/tcp/30333/p2p/12D3KooWQPfshd336TqAomhwv8pv4ZwS1n3VTc9hoBeze9Uop2bP" \
--reserved-nodes="/ip4/62.113.119.176/tcp/30333/p2p/12D3KooWNaKA6iUMnknrmdrbV62G26C7Sn4UwFNRegRobbhMkeJD" \
--reserved-nodes="/ip4/146.190.231.66/tcp/30333/p2p/12D3KooWFuxrCVnJWYwHaXYyrpKHbnJ5XN6fHHEPaqKuRXGU8Fve" \
--reserved-nodes="/ip4/194.147.58.81/tcp/30333/p2p/12D3KooWPfvo8AnxAzwKMNe4To9g2tARYreDU225pktBW8nsswDh" \
--reserved-nodes="/ip4/38.242.194.236/tcp/30333/p2p/12D3KooWFt88PbMX15Z57geHJcnm5Jtdq2LDaAZ7uroj31XSFarr" \
--reserved-nodes="/ip4/65.108.192.240/tcp/30333/p2p/12D3KooWD5jCbZ4VmMVbtHL3sJaXsKvS5V2w3RwbUYBHacPejZtg" \
--reserved-nodes="/ip4/142.132.223.126/tcp/30333/p2p/12D3KooWKpnAiYEWACSvn3XabaYYHEGayGu2xAKtADkng384WpLP" \
--reserved-nodes="/ip4/62.113.117.144/tcp/30333/p2p/12D3KooWPZXi4JumNEAxy1fgHz6CRxoRvfmKKd4mY3T7uAEJcJ4j" \
--reserved-nodes="/ip4/5.189.188.163/tcp/30333/p2p/12D3KooWB63WnNWv3ynGhMwwj7mCxiaZjhkQ4MaxZb3gRpY7nfz2" \
--reserved-nodes="/ip4/138.201.60.109/tcp/30333/p2p/12D3KooWS9HrWQTPdVNWhUvAy4qbiG2USsaaxJ1f1ehPhPTtHumv" \
--reserved-nodes="/ip4/183.222.174.74/tcp/40607/p2p/12D3KooWPbn2aar2wwjBPznWQoR1gDuVKFvUXMhjmkZxU5PhH8KC" \
--reserved-nodes="/ip4/172.104.226.129/tcp/30333/p2p/12D3KooWCi6tDSpGCDw7AmYGniGRgHFb9P2UMH9txVqcn2AzNjsS" \
--reserved-nodes="/ip4/38.242.199.167/tcp/30333/p2p/12D3KooWAvHsLo3avayax4qd35CPMXMGAuvKYq3jbVUFUrh82d97" \
--reserved-nodes="/ip4/65.108.96.104/tcp/30333/p2p/12D3KooWB7qxSqB97k5rpJhL8yDwxdKWfQ34YrJY1Cb6Tars44dE" \
--reserved-nodes="/ip4/195.2.76.206/tcp/30333/p2p/12D3KooWC8gtUzx8avXSL1a2CuaFPRfcgyqTuWUYSgJNtMmCY5iv" \
--reserved-nodes="/ip4/185.229.119.8/tcp/30333/p2p/12D3KooWQ1i4bB9BmT5yr1u712y8XrRpC4LZawmXsU9w1iDHdYHB" \
--reserved-nodes="/ip4/135.181.93.12/tcp/30333/p2p/12D3KooWPnrTEB13cUY2ouw7D5Kgek5G5QpAT1hM5SU9QaBDHSX2" \
--reserved-nodes="/ip4/83.246.196.57/tcp/30333/p2p/12D3KooWL8BiV5wVxiahds4rD77ihVox7KqmV935GQKDEaijtpap" \
--reserved-nodes="/ip4/194.35.120.53/tcp/30333/p2p/12D3KooWDsX2PBZbLDyjTAF8ci5FLk27ZKghnwsBBHEKA5nJFKRf" \
--reserved-nodes="/ip4/38.242.239.34/tcp/30333/p2p/12D3KooWMh6JPZxqfxR3R6TA3rRHNHQaiKimUqs9gGG1UuDbK5Pu" \
--reserved-nodes="/ip4/111.9.31.176/tcp/40410/p2p/12D3KooWPYUrdvDJPfRPN4MLMWPKuTA4AULGMbavFzn9Gu3ydPdM" \
--reserved-nodes="/ip4/173.212.198.101/tcp/30333/p2p/12D3KooWKnpMvoEyKhnE8fTXyDQLsgqz41yDTuUUtEJhq8XWVTZ1" \
--reserved-nodes="/ip4/142.132.223.25/tcp/30333/p2p/12D3KooWSVfNL8hMb85rKp4YLBcuEvnUYcW1FvVTVpLXBAKDsqvX" \
--reserved-nodes="/ip4/65.108.40.224/tcp/30333/p2p/12D3KooWL6W2Xv24DApDNsYBqJ1Qrd32X2zGBJMr9AwTmGk9Z1NH" \
--reserved-nodes="/ip4/135.181.89.153/tcp/30333/p2p/12D3KooWQEAKeev7fyryoEbtGmAhspdEUj4fAu8YSiXNhFZBCvUq" \
--reserved-nodes="/ip4/154.31.34.194/tcp/30333/p2p/12D3KooWHjV3PXa1u2c146gN9qzxXHvsWkJvXaLarKtZ8ZVwi2EF" \
--reserved-nodes="/ip4/207.180.195.56/tcp/30333/p2p/12D3KooWBKTKEQKnX5TKet7MJxihfMUpKK6vVZ3WZiHcF19TpiWJ" \
--reserved-nodes="/ip4/149.102.145.237/tcp/30333/p2p/12D3KooWHywqLHuRrceuPuAjymm1Pz1UhtLduF3zQSdwHXMiS41S" \
--reserved-nodes="/ip4/81.30.156.53/tcp/30333/p2p/12D3KooWKa99fWhwoAw5StPXh5VVEvLYxUbUDy4SBS3ryc9SsVBx" \
--reserved-nodes="/ip4/135.181.177.90/tcp/30333/p2p/12D3KooWPuLRiTTqi5L1SNiqyLdkND3BwM5b6x33KCGZAEakCRCq" \
--reserved-nodes="/ip4/95.111.254.65/tcp/30333/p2p/12D3KooWGmZGuoHZuLXm4z5qmJcNNBHE4Fu4Q38NwqqRPeP89FXY" \
--reserved-nodes="/ip4/183.222.63.188/tcp/41010/p2p/12D3KooWCbf7vgCqeQKtcVoHqUGn1n8FTgieYcLYhjuwqusoHnyx" \
--reserved-nodes="/ip4/65.109.15.71/tcp/30333/p2p/12D3KooWNNj1reGPMhEDmAmLX4qFhbwLSkkYcQJyu4eNiCbr7VKZ" \
--reserved-nodes="/ip4/111.9.31.176/tcp/40403/p2p/12D3KooWQujR1bvmu5sZmXSEnYpGn52FvDQLCQAKEQauKoakVAmz" \
--reserved-nodes="/ip4/38.242.210.22/tcp/30333/p2p/12D3KooWAgiRP6haqMoPKjyHrmsRuKeV2sC8VbiqK78kof54oBVm" \
--reserved-nodes="/ip4/183.222.63.188/tcp/41007/p2p/12D3KooWA1W5B9dHx7becL17N5yCkFnEdHNMh8fG4BrgGb2WtKnY" \
--reserved-nodes="/ip4/65.21.49.146/tcp/30333/p2p/12D3KooWPxeJ2asRDnff6sv3q6ynkoVFzsB8U2yeRUvmF4GsnCX1" \
--reserved-nodes="/ip4/66.94.118.189/tcp/30333/p2p/12D3KooWEaToz3oNxaDeeFrVdkpNwP7ZqyNTuVJhhNkeaboHwbeZ" \
--reserved-nodes="/ip4/154.53.51.114/tcp/30333/p2p/12D3KooWSvPjLuZbM2zrZnWTDeF332gqqrJW1GNDakAHuRuLQ6xc" \
--reserved-nodes="/ip4/161.97.130.114/tcp/30333/p2p/12D3KooWDTwKWjiAdnWRSX81g8AeTPAGPjgsTRZdKA59LBVZQrZT" \
--reserved-nodes="/ip4/185.194.216.221/tcp/30333/p2p/12D3KooWBMsb1qRBH26d7ty2aMLS4jK2Bvb12ghh4So4q3ZJmVSW" \
--reserved-nodes="/ip4/49.12.96.13/tcp/30333/p2p/12D3KooWRzstsrETrXsvAZ5d2WLQ6339yQTgiuo7vYhsi9KtjMah" \
--reserved-nodes="/ip4/75.119.140.50/tcp/30333/p2p/12D3KooWGTgJdB4Uur2djo8GqLufXfXyY9J8GXmsXkhyomXg7fEk" \
--reserved-nodes="/ip4/173.212.216.232/tcp/30333/p2p/12D3KooWBvNhQ2vEd6mFFno7RFNLL2YbHxsagnLJnT8MS5bbtkRn" \
--reserved-nodes="/ip4/65.108.245.224/tcp/30333/p2p/12D3KooWCChuiZc7fPZNFRL9yCqohBVV2LSUaoYQxrKqc7iXQCtq" \
--reserved-nodes="/ip4/65.109.5.102/tcp/30333/p2p/12D3KooWAEERRz7vzMR2qb1Ee36uAcvxWZK77gaHcuGjqzqFzMhf" \
--reserved-nodes="/ip4/154.12.228.90/tcp/30333/p2p/12D3KooWR9PLrzcwdBtmSmBrjPXkkQ3dvx9bXrfFyPjca3PPV27s" \
--reserved-nodes="/ip4/173.249.1.169/tcp/30333/p2p/12D3KooWFmoyqK1cKT9wGXPdnXy2BzDiHGg9uFUuKeQRLk4ssctW" \
--reserved-nodes="/ip4/75.119.129.64/tcp/30333/p2p/12D3KooWFg51UTtybnyyN1Jue92yH5WaFJM4EZB8UR1nsDuPWvvg" \
--reserved-nodes="/ip4/178.170.39.43/tcp/30333/p2p/12D3KooWQ4XdL1CSsgr4nTuzpewKUR3qt5yBSj7aJ3XaNaFMrAp4" \
--reserved-nodes="/ip4/117.173.218.223/tcp/40501/p2p/12D3KooWL6tG9CKrA9t12KFS4R3ReQwmYFqhp6PKsGJpRa2HqfMP" \
--reserved-nodes="/ip4/65.108.255.148/tcp/30333/p2p/12D3KooW9qWGxUBb7RWyss7Afij2RNZDvSESgm1NamFmkjqECTn4" \
--reserved-nodes="/ip4/128.0.139.225/tcp/30344/p2p/12D3KooWK9bWDE7Pb2bEKxKKxJ5NaqSaR28q8MseaEKfZyiKDo6f" \
--reserved-nodes="/ip4/194.163.184.223/tcp/30333/p2p/12D3KooWMGE2Kgf2ApXGAUgvraW9XmtAwQ8RiuuHSFbuUWmr7hpV" \
--reserved-nodes="/ip4/65.21.89.224/tcp/30333/p2p/12D3KooWEWMiM8u1B398enACCGLxbQ4DnvrsKCaYRFGEozhG2R2L" \
--reserved-nodes="/ip4/38.242.194.167/tcp/30333/p2p/12D3KooWMqJ1ksdgcBt2BoerhYAueybbUps7tvraWY8X2H8Vvy4v" \
--reserved-nodes="/ip4/5.189.183.251/tcp/30333/p2p/12D3KooWJZdyRL1ygK5z21Pa3wFVFCCNppkguGz8adMw2s5PvFd2" \
--reserved-nodes="/ip4/178.170.46.55/tcp/30333/p2p/12D3KooWLvYdxay88tpq5syGSsDnsvUBKhxE5YPXPBW6VGUHkZbn" \
--reserved-nodes="/ip4/111.9.31.178/tcp/41201/p2p/12D3KooWN79kqpY6sD3M3C2d79P9oKU52tw68KubHyChyGexr5Lu" \
--reserved-nodes="/ip4/95.111.254.11/tcp/30333/p2p/12D3KooWBDRPGKW6LqTd6ruoiZPvmMU5dezdp4fQNFgR53JxJcoK" \
--reserved-nodes="/ip4/38.242.199.141/tcp/30333/p2p/12D3KooWQb6D7Xzdt37NbDzaUjUe3zcMtTdXPdAvjsHTgjqweLBq" \
--reserved-nodes="/ip4/135.181.82.90/tcp/30333/p2p/12D3KooWGZ8MDo2AWsM2ZMm9GUQaTA6tNdVZFuW7nkdqMqT91W1i" \
--reserved-nodes="/ip4/161.97.180.29/tcp/30333/p2p/12D3KooWFE13YP6Thjac1mqv41CbxEpud8Dr9Jyh8VSsDgcdGZ7o" \
--reserved-nodes="/ip4/207.180.212.150/tcp/30333/p2p/12D3KooWHpWopDHUY6jJDzgFe9qZTCAgaGc1UFdgPD7nsBfehjAB" \
--reserved-nodes="/ip4/117.174.25.121/tcp/40705/p2p/12D3KooWRzGtVWo7gwUCSbT2mkbDW4RBMF68LqF6ffvkPs9MDy3e" \
--reserved-nodes="/ip4/161.97.179.125/tcp/30333/p2p/12D3KooWLHXLMerq4T7TjQCeGpV4iautFhocjWttugDCDBZzk15j" \
--reserved-nodes="/ip4/111.9.31.178/tcp/41203/p2p/12D3KooWNMLZCsqpf3iu5XhzWGrsFUmHT4aS9bAVd8dRVMV8Fpko" \
--reserved-nodes="/ip4/65.108.10.54/tcp/30333/p2p/12D3KooWG5xp83wvh8Hu2e2274HC9sCztPbgPHEmxxYz4FNshgv2" \
--reserved-nodes="/ip4/95.217.113.18/tcp/30333/p2p/12D3KooWNSfAG6uDRX1jMmwKadHh5SGX6v8DnzzPdCsHVaJ7sfMn" \
--reserved-nodes="/ip4/62.171.190.42/tcp/30333/p2p/12D3KooWRR5NKDcaMsVoB9suciqXuVN8DK1YE44M2ckpSucqoxp5" \
--reserved-nodes="/ip4/154.53.55.82/tcp/30333/p2p/12D3KooWRjwKNjHGJr4TtuaBwr2vrFQpcLUUwp5TyLMmipPVg3CF" \
--reserved-nodes="/ip4/161.97.142.57/tcp/30333/p2p/12D3KooWKVesVFFSe9UEqBjjko4AAQz5uQFzPJ8DSojo1uAzMGbU" \
--reserved-nodes="/ip4/92.119.112.58/tcp/30333/p2p/12D3KooWD8TdncbVqajM218xaSTC7BrdAe9uTaZBWF4oxeAi5Br1" \
--reserved-nodes="/ip4/207.244.242.244/tcp/30333/p2p/12D3KooWP4dnFbAXBmduiCB2nM1AqkQ9RqYLmorzSM8zWViKbj1A" \
--reserved-nodes="/ip4/117.173.218.133/tcp/40901/p2p/12D3KooWPKUXNhaPEMQaZ7GPJz3XtFeoqhqKycSqyjjqA8jcYmyE" \
--reserved-nodes="/ip4/65.108.245.30/tcp/30333/p2p/12D3KooWRhYHBQyzghHwzaNmVgGSVMj5spusCahozNgHz7aSTN4t" \
--reserved-nodes="/ip4/167.235.21.149/tcp/30333/p2p/12D3KooW9uhGQajt1EkYhNom4BKfhrAxb2jgma7kDsTJ4Zafsksh" \
--reserved-nodes="/ip4/159.69.58.44/tcp/30333/p2p/12D3KooWGiqtXPWiYCSA22ZYkue27kRQ8tD7S6dv6jSocBShNGpg" \
--reserved-nodes="/ip4/78.47.14.110/tcp/30333/p2p/12D3KooWHMCPXMgCX81bJyoTqGtdJzmmQuhbP7LqWyEyuF5JT7m8" \
--reserved-nodes="/ip4/188.34.190.67/tcp/30333/p2p/12D3KooWEwscz2uLwUTHruYuzqrCQJWRyoS813ZB7apRc7cFmvuD" \
--reserved-nodes="/ip4/209.145.48.32/tcp/30333/p2p/12D3KooWSa3ZTTT2UBhVK6B1PTh5oQ3kAxqVAsnBKwi4KcN6pKjR" \
--reserved-nodes="/ip4/46.4.115.242/tcp/30333/p2p/12D3KooWFSfbto9b7DfMWSgGkLvaMYTim9JcYuN4iCQKxfeYEiXH" \
--reserved-nodes="/ip4/117.173.218.222/tcp/41100/p2p/12D3KooWG6YrNjWd6fn78Zo6UEBNqBwEHd3uu2tc63D3ycGV218s" \
--reserved-nodes="/ip4/135.181.36.13/tcp/30333/p2p/12D3KooWD6pLpk4MnfLy2S2uDy4aXKAkydMoBykUGnWZk1XcTFT7" \
--reserved-nodes="/ip4/168.119.105.149/tcp/30333/p2p/12D3KooW9sErGfsWENeDngLrAP7eM2sw8zvJSzqnh2qVekTmTWbn" \
--reserved-nodes="/ip4/194.163.183.49/tcp/30333/p2p/12D3KooWCGUpuHwq7ra3VixYb5aV9WviuUcyQsJMoUPCPCzkPvdg" \
--reserved-nodes="/ip4/5.255.101.166/tcp/30333/p2p/12D3KooWPBvxoJwsdkjfyAjmjD9xC8bBYR6KNew9TAu2KeDWNSQU" \
--reserved-nodes="/ip4/65.109.3.40/tcp/30333/p2p/12D3KooWQwg5MqsoWNvswNpKF8UqBxQdnj37EEgJSBJRAiLY6rFh" \
--reserved-nodes="/ip4/135.181.82.2/tcp/30333/p2p/12D3KooWDmvVUrAAioi3xHnUFQaFdA4nDXvG3M9Q2nn8UX3XoTK5" \
--reserved-nodes="/ip4/78.31.66.188/tcp/30333/p2p/12D3KooWFsFNqh1Bo6KkSHJc6uWidfCZQRf6QuPnVp59TAA3ZcCd" \
--reserved-nodes="/ip4/185.252.232.32/tcp/30333/p2p/12D3KooWBLSUeeoh1TG9JxbGu6m6sXtCBh3cPxSAyLe3HkxukXNz" \
--reserved-nodes="/ip4/65.108.11.80/tcp/30333/p2p/12D3KooWSyfhVzXgsQbciJAKnmowypr46MtZjZt2YMpL1gqAA2Dy" \
--reserved-nodes="/ip4/207.180.219.116/tcp/30333/p2p/12D3KooWJXJfwGrEWHbiVyhZfd6ohJKwsGBy5NaFno7FUUNpZYi9" \
--reserved-nodes="/ip4/146.19.24.56/tcp/30333/p2p/12D3KooWJkPoz95vDehdQdyY8jvrZ3jzCcUoLEojN67zbvXjcNgs" \
--reserved-nodes="/ip4/194.147.58.6/tcp/30335/p2p/12D3KooWBwbyunNCMuv3AZp4KsmToT6Hfa56s4jaMhx7F1FJHqNJ" \
--reserved-nodes="/ip4/161.97.78.4/tcp/30333/p2p/12D3KooWPBqmGiBNcL3WwZcdcMzHENxbinhJV8aK4TXApUsaRzmC" \
--chain gemini-1 \
--execution wasm \
--pruning 1024 \
--keep-blocks 1024 \
--in-peers 100 \
--validator \
--name $SUBSPACE_NODE_NAME 
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service

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
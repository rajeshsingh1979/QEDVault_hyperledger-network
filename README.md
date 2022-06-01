# QEDVault_hyperledger-network


> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-orderer.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-admin.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-manufacturer.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-consumer.yaml --output="organizations"

> ./bin/configtxgen -configPath=./config/configtx -outputBlock=./channel-artifacts/first-channel.block -profile QEDVaultApplicationGenesis -channelID first-channel

> docker exec -it cli bash

> ./scripts/set-channel.sh first-channel admin

> osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY

> ./scripts/set-channel.sh first-channel manufacturer

> osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY

> ./scripts/set-channel.sh first-channel consumer

> osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY


> ./automate/join-channel.sh first-channel
> ./automate/deploy-cc.sh first-channel usercc 0.0.1 1
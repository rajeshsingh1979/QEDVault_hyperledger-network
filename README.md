# QEDVault_hyperledger-network


> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-orderer.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-admin.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-manufacturer.yaml --output="organizations"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-consumer.yaml --output="organizations"

> ./bin/configtxgen -configPath=./config/configtx -outputBlock=./channel-artifacts/system-genesis.block -profile QEDVaultApplicationGenesis -channelID system-genesis

> docker exec -it cli bash

> ./scripts/set-channel.sh system-genesis

> osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY

> ./bin/configtxgen -configPath=./config/configtx -outputBlock=./channel-artifacts/first-channel.block -profile QEDVaultApplicationGenesis -channelID first-channel
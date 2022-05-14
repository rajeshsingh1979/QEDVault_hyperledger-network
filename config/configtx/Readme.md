To generate the orderer, run the following command
> ./bin/configtxgen -configPath=./config/configtx -outputBlock=./channel-artifacts/orderer-genesis.block -profile QEDVaultApplicationGenesis -channelID orderer-genesis

> ./scripts/set-channel.sh orderer-genesis
> osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o orderer.example.com:7053 --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY

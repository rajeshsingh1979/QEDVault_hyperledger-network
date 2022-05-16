channel_name=$1

. ./scripts/set-channel.sh $channel_name admin
osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY
./scripts/channel-join.sh $channel_name admin

. ./scripts/set-channel.sh $channel_name consumer
osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY
./scripts/channel-join.sh $channel_name consumer


. ./scripts/set-channel.sh $channel_name manufacturer
osnadmin channel join --channelID $CHANNEL_ID --config-block ./channel-artifacts/${CHANNEL_ID}.block -o $ORDERER_ADDRESS --ca-file $ORDERER_CA --client-cert $ORDERER_ADMIN_TLS_SIGN_CERT --client-key $ORDERER_ADMIN_TLS_PRIVATE_KEY
./scripts/channel-join.sh $channel_name manufacturer
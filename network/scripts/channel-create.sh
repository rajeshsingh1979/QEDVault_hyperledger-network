PROFILE=$1
shift

. ./scripts/set-channel.sh $1
. ./scripts/set-org.sh $2


BLOCKFILE=./channel-artifacts/$CHANNEL_ID.block
set -x
configtxgen -configPath $FABRIC_CFG_PATH -outputBlock $BLOCKFILE -profile $PROFILE -channelID $CHANNEL_ID
set +x

set -x
peer channel join -o $ORDERER_ADDRESS --cafile $ORDERER_CA -b  $BLOCKFILE
set +x
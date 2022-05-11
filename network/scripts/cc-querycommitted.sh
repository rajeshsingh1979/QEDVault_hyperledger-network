. ./scripts/set-channel.sh $1
. ./scripts/set-org.sh $2
. ./scripts/set-cc.sh $3


set -x
peer lifecycle chaincode querycommitted --channelID $CHANNEL_ID --name ${CC_NAME} >&log.txt
set +x
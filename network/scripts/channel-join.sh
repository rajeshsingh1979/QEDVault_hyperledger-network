. ./scripts/set-channel.sh $1 && shift
. ./scripts/set-org.sh $1 Admin $2

BLOCKFILE=./channel-artifacts/$CHANNEL_ID.block
set -x
peer channel join -o $ORDERER_ADDRESS --cafile $ORDERER_CA -b  $BLOCKFILE
set +x
. ./scripts/set-channel.sh $1 && shift
. ./scripts/set-org.sh $1 Admin $2

BLOCKFILE=./channel-artifacts/$CHANNEL_ID.block
set -x
peer channel join -o orderer.example.com:7053 --cafile $ORDERER_CA -b  $BLOCKFILE
set +x
# . ./scripts/set-channel.sh $1 && shift
. ./scripts/set-cc.sh $1 $2 && shift && shift
. ./scripts/set-org.sh $1 Admin $2

set -x
peer lifecycle chaincode install ./packages/${CORE_PEER_LOCALMSPID}_${CC_NAME}-${CC_VERSION}.tar.gz
set +x

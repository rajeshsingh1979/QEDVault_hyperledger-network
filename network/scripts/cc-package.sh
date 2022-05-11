. ./scripts/set-org.sh $1
. ./scripts/set-cc.sh $2 $3

set -x
peer lifecycle chaincode package ./packages/${CORE_PEER_LOCALMSPID}_${CC_NAME}-${CC_VERSION}.tar.gz -p ./chaincodes/${CC_NAME} -l golang --label ${CC_NAME}_${CC_VERSION}

set +x

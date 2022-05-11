. ./scripts/set-org.sh $1 && shift
. ./scripts/set-cc.sh $1 $2


peer lifecycle chaincode queryinstalled  | grep ${CHAINCODE_ID}_${CC_VERSION}
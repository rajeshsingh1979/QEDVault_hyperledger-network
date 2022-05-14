. ./scripts/set-channel.sh $1 && shift
. ./scripts/set-org.sh $1
. ./scripts/set-cc.sh $2 $3 

CC_SEQUENCE=$4


set -x
# peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} --output json >&log.txt
peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} --sequence ${CC_SEQUENCE} --signature-policy 'OR("QEDVaultMSP.peer", "ManufacturerMSP.peer", "ConsumerMSP.peer")' --output json
set +x
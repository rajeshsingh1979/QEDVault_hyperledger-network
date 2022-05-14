# . ./scripts/set-channel.sh $1 && shift
# . ./scripts/set-cc.sh $1 $2 && shift && shift
# . ./scripts/set-org.sh $1 && shift

CC_SEQUENCE=$1

peer lifecycle chaincode queryinstalled >&log.txt
PACKAGE_ID=$(sed -n "/${CC_NAME}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
echo $PACKAGE_ID
set -x
# peer lifecycle chaincode approveformyorg -o $ORDERER_ADDRESS  --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} --package-id ${PACKAGE_ID} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} >&log.txt
# peer lifecycle chaincode approveformyorg -o $ORDERER_ADDRESS  --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} --package-id ${PACKAGE_ID} --sequence ${CC_SEQUENCE} --signature-policy 'OR("Org1MSP.peer", "Org2MSP.peer")'
peer lifecycle chaincode approveformyorg -o $ORDERER_ADDRESS  --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} --package-id ${PACKAGE_ID} --sequence ${CC_SEQUENCE} --signature-policy 'OR("QEDVaultMSP.peer", "ManufacturerMSP.peer", "ConsumerMSP.peer")'
set +x
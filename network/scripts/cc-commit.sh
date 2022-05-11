# . ./scripts/set-channel.sh $1 && shift
COMMITTING_ORG=$1
shift
# . ./scripts/set-cc.sh $1 $2 && shift && shift

CC_SEQUENCE=$1
shift


parsePeerConnectionParameters() {
  PEER_CONN_PARMS=""
  PEERS=""
  while [ "$#" -gt 0 ]; do
    . ./scripts/set-org.sh $1
    
    PEER_CONN_PARMS="${PEER_CONN_PARMS} --peerAddresses $CORE_PEER_ADDRESS"
    ## Set path to TLS certificate
    TLSINFO="--tlsRootCertFiles ${CORE_PEER_TLS_ROOTCERT_FILE}"
    PEER_CONN_PARMS=("${PEER_CONN_PARMS[@]} ${TLSINFO[@]}")
    # shift by one to get to the next organization
    shift
  done
}

parsePeerConnectionParameters $@

. ./scripts/set-org.sh $COMMITTING_ORG

set -x
# # peer lifecycle chaincode commit -o $ORDERER_ADDRESS --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} "${PEER_CONN_PARMS[@]}" --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} ${CC_END_POLICY} ${CC_COLL_CONFIG} >&log.txt
# peer lifecycle chaincode commit -o $ORDERER_ADDRESS --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} $PEER_CONN_PARMS --sequence ${CC_SEQUENCE} --signature-policy 'OR("Org1MSP.peer", "Org2MSP.peer")'
peer lifecycle chaincode commit -o $ORDERER_ADDRESS --tls --cafile "$ORDERER_CA" --channelID $CHANNEL_ID --name ${CC_NAME} --version ${CC_VERSION} $PEER_CONN_PARMS --sequence ${CC_SEQUENCE} --signature-policy 'OR("Org1MSP.peer")'
set +x
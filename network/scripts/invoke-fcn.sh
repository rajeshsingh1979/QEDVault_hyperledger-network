#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

# This is a collection of bash functions used by different scripts






CHANNEL_NAME=$1
CC_NAME=$2
FCN_NAME=$3
ARGS=$4

. ./scripts/set-channel.sh $1
. ./scripts/set-cc.sh $2

shift 4


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
res=$?
verifyResult $res "Invoke transaction failed on channel '$CHANNEL_NAME' due to uneven number of peer and org parameters "

# while 'peer chaincode' command can get the orderer endpoint from the
# peer (if join was successful), let's supply it directly as we know
# it using the "-o" option
# fcn_call="{\"function\":\"NewPayee\",\"Args\":[\"123\", \"423\"]}"
# fcn_call='{"function":"NewPayee","Args":["123", "423"]}'
fcn_call="{\"function\":\"${FCN_NAME}\",\"Args\":${ARGS}}"
warnln "invoke fcn call:${fcn_call}"
set -x
peer chaincode invoke -o $ORDERER_ADDRESS --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} $PEER_CONN_PARMS -c "${fcn_call}" >&log.txt
res=$?

{ set +x; } 2>/dev/null
cat log.txt
verifyResult $res "Invoke execution on $PEERS failed "
successln "Invoke transaction successful on $PEERS on channel '$CHANNEL_NAME'"



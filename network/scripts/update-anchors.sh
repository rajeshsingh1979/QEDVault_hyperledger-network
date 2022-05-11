#!/bin/bash

. ./scripts/set-channel.sh $1 && shift
. ./scripts/set-org.sh $1 && shift

ANCHORS=$1
WDIR=${PWD}/channel-artifacts/${CORE_PEER_LOCALMSPID}anchors
echo $WDIR
echo '.channel_group.groups.Application.groups.'$CORE_PEER_LOCALMSPID'.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": '$ANCHORS'},"version": "0"}}'




mkdir -p $WDIR
rm -rf $WDIR
mkdir -p $WDIR

set -x
peer channel fetch config ${WDIR}/channel_config.pb -o $ORDERER_ADDRESS -c $CHANNEL_ID --tls --cafile ${ORDERER_CA}

configtxlator proto_decode --input ${WDIR}/channel_config.pb --type common.Block --output ${WDIR}/channel_config.json

jq .data.data[0].payload.data.config ${WDIR}/channel_config.json >  ${WDIR}/data_channel_config.json

jq '.channel_group.groups.Application.groups.'$CORE_PEER_LOCALMSPID'.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": '${ANCHORS}'},"version": "0"}}' ${WDIR}/data_channel_config.json > ${WDIR}/modified_data_channel_config.json


configtxlator proto_encode --type common.Config --input ${WDIR}/data_channel_config.json --output ${WDIR}/original_config.pb
configtxlator proto_encode --type common.Config --input ${WDIR}/modified_data_channel_config.json --output ${WDIR}/modified_config.pb

configtxlator compute_update --channel_id $CHANNEL_ID --original ${WDIR}/original_config.pb --updated ${WDIR}/modified_config.pb --output ${WDIR}/config_update.pb

configtxlator proto_decode --input ${WDIR}/config_update.pb --type common.ConfigUpdate --output ${WDIR}/config_update.json


echo '{"payload":{"header":{"channel_header":{"channel_id":"'$CHANNEL_ID'", "type":2}},"data":{"config_update":'$(cat ${WDIR}/config_update.json)'}}}' | jq . >${WDIR}/config_update_in_envelope.json


configtxlator proto_encode --input ${WDIR}/config_update_in_envelope.json --type common.Envelope --output ${WDIR}/updateAnchors.tx

 
peer channel update -o $ORDERER_ADDRESS -c $CHANNEL_ID -f ${WDIR}/updateAnchors.tx --tls --cafile $ORDERER_CA

set +x
#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0


ORDERER=${2:-admin}


export CHANNEL_ID=$1
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/orderer.qedvault.com/tlsca/tlsca.orderer.qedvault.com-cert.pem
export ORDERER_ADMIN_TLS_SIGN_CERT=${PWD}/organizations/ordererOrganizations/orderer.qedvault.com/users/Admin@orderer.qedvault.com/tls/client.crt
export ORDERER_ADMIN_TLS_PRIVATE_KEY=${PWD}/organizations/ordererOrganizations/orderer.qedvault.com/users/Admin@orderer.qedvault.com/tls/client.key
export ORDERER_ADDRESS=$ORDERER.orderer.qedvault.com:7050


# export ORDERER_ADMIN_TLS_SIGN_CERT=${PWD}/organizations/ordererOrganizations/orderer.qedvault.com/orderers/admin.orderer.qedvault.com/tls/server.crt
# export ORDERER_ADMIN_TLS_PRIVATE_KEY=${PWD}/organizations/ordererOrganizations/orderer.qedvault.com/orderers/admin.orderer.qedvault.com/tls/server.key


# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"


# output the variables that need to be set
# echo "CORE_PEER_TLS_ENABLED=true"
# echo "CHANNEL_ID=${CHANNEL_ID}"
# echo "ORDERER_CA=${ORDERER_CA}"
# echo "ORDERER_ADMIN_TLS_SIGN_CERT=${ORDERER_ADMIN_TLS_SIGN_CERT}"
# echo "ORDERER_ADMIN_TLS_PRIVATE_KEY=${ORDERER_ADMIN_TLS_PRIVATE_KEY}"


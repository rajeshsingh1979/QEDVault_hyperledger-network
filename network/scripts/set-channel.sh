#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0




export CHANNEL_ID=$1
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
export ORDERER_ADMIN_TLS_SIGN_CERT=${PWD}/organizations/ordererOrganizations/example.com/users/Admin@example.com/tls/client.crt
export ORDERER_ADMIN_TLS_PRIVATE_KEY=${PWD}/organizations/ordererOrganizations/example.com/users/Admin@example.com/tls/client.key
export ORDERER_ADDRESS=orderer.example.com:7050

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"


# output the variables that need to be set
echo "CORE_PEER_TLS_ENABLED=true"
echo "CHANNEL_ID=${CHANNEL_ID}"
echo "ORDERER_CA=${ORDERER_CA}"
echo "ORDERER_ADMIN_TLS_SIGN_CERT=${ORDERER_ADMIN_TLS_SIGN_CERT}"
echo "ORDERER_ADMIN_TLS_PRIVATE_KEY=${ORDERER_ADMIN_TLS_PRIVATE_KEY}"


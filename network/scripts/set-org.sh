#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0




# default to using Org1
ORG=${1:-Org1}
USERID=${2:-Admin}
PEER=${3:-peer0}
# Exit on first error, print all commands.
# set -e
# set -o pipefail

# Where am I?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
export CORE_PEER_TLS_ENABLED=true
# export ORDERER_CA=${PWD}/organizations/ordererOrganizations/qedvault.com/tlsca/tlsca.qedvault.com-cert.pem
PEER0_QEDVault_CA=${PWD}/organizations/peerOrganizations/admin.qedvault.com/tlsca/tlsca.admin.qedvault.com-cert.pem
PEER0_MANUFACTURER_CA=${PWD}/organizations/peerOrganizations/org2.qedvault.com/tlsca/tlsca.org2.qedvault.com-cert.pem
PEER0_CONSUMER_CA=${PWD}/organizations/peerOrganizations/org3.qedvault.com/tlsca/tlsca.org3.qedvault.com-cert.pem


if [[ ${ORG,,} == "admin"  ]]; then

   export CORE_PEER_LOCALMSPID=QEDVaultMSP
   export CORE_PEER_MSPCONFIGPATH=${DIR}/organizations/peerOrganizations/admin.qedvault.com/users/${USERID}@admin.qedvault.com/msp
   export CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/organizations/peerOrganizations/admin.qedvault.com/tlsca/tlsca.admin.qedvault.com-cert.pem
   export CORE_PEER_ADDRESS=$PEER.admin.qedvault.com:7051
elif [[ ${ORG,,} == "manufacturer"  ]]; then
   export CORE_PEER_LOCALMSPID=ManufacturerMSP
   export CORE_PEER_MSPCONFIGPATH=${DIR}/organizations/peerOrganizations/manufacturer.qedvault.com/users/${USERID}@manufacturer.qedvault.com/msp
   export CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/organizations/peerOrganizations/manufacturer.qedvault.com/tlsca/tlsca.manufacturer.qedvault.com-cert.pem
   export CORE_PEER_ADDRESS=$PEER.manufacturer.qedvault.com:7051
elif [[ ${ORG,,} == "consumer"  ]]; then
   export CORE_PEER_LOCALMSPID=ConsumerMSP
   export CORE_PEER_MSPCONFIGPATH=${DIR}/organizations/peerOrganizations/consumer.qedvault.com/users/${USERID}@consumer.qedvault.com/msp
   export CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/organizations/peerOrganizations/consumer.qedvault.com/tlsca/tlsca.consumer.qedvault.com-cert.pem
   export CORE_PEER_ADDRESS=$PEER.consumer.qedvault.com:7051

else
   echo "Unknown \"$ORG\", please choose Org1/Digibank or Org2/Magnetocorp"
   echo "For example to get the environment variables to set upa Org2 shell environment run:  ./setOrgEnv.sh Org2"
   echo
   echo "This can be automated to set them as well with:"
   echo
   echo 'export $(./setOrgEnv.sh Org2 | xargs)'
   exit 1
fi

# output the variables that need to be set
# echo "CORE_PEER_TLS_ENABLED=true"
# echo "ORDERER_CA=${ORDERER_CA}"
# echo "CORE_PEER_MSPCONFIGPATH=${CORE_PEER_MSPCONFIGPATH}"
# echo "CORE_PEER_ADDRESS=${CORE_PEER_ADDRESS}"
# echo "CORE_PEER_TLS_ROOTCERT_FILE=${CORE_PEER_TLS_ROOTCERT_FILE}"
# echo "CORE_PEER_LOCALMSPID=${CORE_PEER_LOCALMSPID}"

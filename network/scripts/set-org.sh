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
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
PEER0_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
PEER0_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem
PEER0_ORG3_CA=${PWD}/organizations/peerOrganizations/org3.example.com/tlsca/tlsca.org3.example.com-cert.pem


if [[ ${ORG,,} == "org1" || ${ORG,,} == "digibank" ]]; then

   export CORE_PEER_LOCALMSPID=Org1MSP
   export CORE_PEER_MSPCONFIGPATH=${DIR}/organizations/peerOrganizations/org1.example.com/users/${USERID}@org1.example.com/msp
   export CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
   export CORE_PEER_ADDRESS=$PEER.org1.example.com:7051
elif [[ ${ORG,,} == "org2" || ${ORG,,} == "magnetocorp" ]]; then

   export CORE_PEER_LOCALMSPID=Org2MSP
   export CORE_PEER_MSPCONFIGPATH=${DIR}/organizations/peerOrganizations/org2.example.com/users/${USERID}@org2.example.com/msp
   export CORE_PEER_TLS_ROOTCERT_FILE=${DIR}/organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem
   export CORE_PEER_ADDRESS=$PEER.org2.example.com:7051

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
echo "CORE_PEER_TLS_ENABLED=true"
echo "ORDERER_CA=${ORDERER_CA}"
echo "CORE_PEER_MSPCONFIGPATH=${CORE_PEER_MSPCONFIGPATH}"
echo "CORE_PEER_ADDRESS=${CORE_PEER_ADDRESS}"
echo "CORE_PEER_TLS_ROOTCERT_FILE=${CORE_PEER_TLS_ROOTCERT_FILE}"
echo "CORE_PEER_LOCALMSPID=${CORE_PEER_LOCALMSPID}"

To run this. we need cryptogen tool. The following commands are used for this

> cryptogen generate --config=CONFIG --output="cryto-config"

> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-orderer.yaml --output="organizations"
> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-org1.yaml --output="organizations"
> ./bin/cryptogen generate --config=./config/crypto-config/crypto-config-org2.yaml --output="organizations"
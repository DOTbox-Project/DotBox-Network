#! /bin/bash

chmod -R 0755 ../organizations/crypto-config
# # Delete existing artifacts
rm -rf ../organizations/crypto-config
rm -rf ../channel-artifacts/*
rm -rf ../init_transactions/*


# Generate Crypto artifacts for orderer organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-orderer.yaml --output=../organizations/crypto-config/

# Generate Crypto artifacts for producer organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-producerorg.yaml --output=../organizations/crypto-config/

# Generate Crypto artifacts for processor organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-processororg.yaml --output=../organizations/crypto-config/

# Generate Crypto artifacts for regulator organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-regulatororg.yaml --output=../organizations/crypto-config/


# Generate Crypto artifacts for wholesale organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-wholesaleorg.yaml --output=../organizations/crypto-config/

# Generate Crypto artifacts for retail organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-retailorg.yaml --output=../organizations/crypto-config/

# Generate Crypto artifacts for consumer organizations
cryptogen generate --config=../organizations/cryptogen/crypto-config-consumerorg.yaml --output=../organizations/crypto-config/




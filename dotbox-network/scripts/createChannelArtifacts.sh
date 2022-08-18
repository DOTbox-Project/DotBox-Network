#! /bin/bash

# System channel
SYS_CHANNEL="sys-channel"

# channel name defaults to "mychannel"
CHANNEL_NAME="channel1"


echo $CHANNEL_NAME

# Generate System Genesis block
createSystemGenesisBlock(){
    configtxgen -profile OrdererGenesis -configPath ../configtx/ -channelID $SYS_CHANNEL  -outputBlock ../channel-artifacts/genesis.block
}

# Generate channel configuration block
createChannelConfigurationBlock(){
    configtxgen -profile BasicChannel -configPath ../configtx/ -outputCreateChannelTx ../init_transactions/$CHANNEL_NAME.tx -channelID $CHANNEL_NAME
}

# Create Anchors for the various organizations
createAnchorPeerUpdate(){
    echo "#######    Generating anchor peer update for producerOrgMSP  ##########"
    configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/ProducerOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg ProducerOrgMSP

    # echo "#######    Generating anchor peer update for processorOrgMSP  ##########"
    # configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/ProcessorOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg ProcessorOrgMSP

    # echo "#######    Generating anchor peer update for regulatorOrgMSP  ##########"
    # configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/RegulatorOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg RegulatorOrgMSP

    # echo "#######    Generating anchor peer update for wholesaleOrgMSP  ##########"
    # configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/WholesaleOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg WholesaleOrgMSP

    # echo "#######    Generating anchor peer update for retailOrgMSP  ##########"
    # configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/RetailOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg RetailOrgMSP

    # echo "#######    Generating anchor peer update for consumerOrgMSP  ##########"
    # configtxgen -profile BasicChannel -configPath ../configtx/ -outputAnchorPeersUpdate ../init_transactions/ConsumerOrgMSPanchors.tx -channelID $CHANNEL_NAME -asOrg ConsumerOrgMSP
}


createSystemGenesisBlock
createChannelConfigurationBlock
createAnchorPeerUpdate
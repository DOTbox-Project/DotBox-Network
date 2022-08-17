export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=${PWD}/../organizations/crypto-config/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/tlscacerts/tlsca.dot-box.com-cert.pem
export PEER0_PRODUCERORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/ca.crt
export PEER0_PROCESSORORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/ca.crt
export PEER0_REGULATORORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/ca.crt
export PEER0_WHOLESALEORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/ca.crt
export PEER0_RETAILORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/ca.crt
export PEER0_CONSUMERORG_CA=${PWD}/../organizations/crypto-config/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/ca.crt

export FABRIC_CFG_PATH=${PWD}/../config/

export CHANNEL_NAME=channel1


setGlobalsForOrderer(){
    export CORE_PEER_LOCALMSPID="OrdererMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/crypto-config/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/tlscacerts/tlsca.dot-box.com-cert.pem
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/ordererOrganizations/dot-box.com/users/Admin@dot-box.com/msp
    
}

setGlobalsForPeer0ProducerOrg(){
    export CORE_PEER_LOCALMSPID="ProducerOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PRODUCERORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/users/Admin@producerorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
}

setGlobalsForPeer1ProducerOrg(){
    export CORE_PEER_LOCALMSPID="ProducerOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PRODUCERORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/users/Admin@producerorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:8051
    
}

setGlobalsForPeer0ProcessorOrg(){
    export CORE_PEER_LOCALMSPID="ProcessorOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PROCESSORORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/processororg.dot-box.com/users/Admin@processororg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:9051
    
}

setGlobalsForPeer1ProcessorOrg(){
    export CORE_PEER_LOCALMSPID="ProcessorOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_PROCESSORORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/processororg.dot-box.com/users/Admin@processororg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:10051
    
}

setGlobalsForPeer0RegulatorOrg(){
    export CORE_PEER_LOCALMSPID="RegulatorOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_REGULATORORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/regulatororg.dot-box.com/users/Admin@regulatororg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:11051
    
}

setGlobalsForPeer1RegulatorOrg(){
    export CORE_PEER_LOCALMSPID="RegulatorOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_REGULATORORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/regulatororg.dot-box.com/users/Admin@regulatororg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:12051
    
}

setGlobalsForPeer0WholesaleOrg(){
    export CORE_PEER_LOCALMSPID="WholesaleOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_WHOLESALEORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/wholesaleorg.dot-box.com/users/Admin@wholesaleorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:13051
    
}

setGlobalsForPeer1WholesaleOrg(){
    export CORE_PEER_LOCALMSPID="WholesaleOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_WHOLESALEORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/wholesaleorg.dot-box.com/users/Admin@wholesaleorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:14051
    
}

setGlobalsForPeer0RetailOrg(){
    export CORE_PEER_LOCALMSPID="RetailOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_RETAILORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/retailorg.dot-box.com/users/Admin@retailorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:15051
    
}

setGlobalsForPeer1RetailOrg(){
    export CORE_PEER_LOCALMSPID="RetailOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_RETAILORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/retailorg.dot-box.com/users/Admin@retailorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:16051
    
}

setGlobalsForPeer0ConsumerOrg(){
    export CORE_PEER_LOCALMSPID="ConsumerOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_CONSUMERORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/consumerorg.dot-box.com/users/Admin@consumerorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:17051
    
}

setGlobalsForPeer1ConsumerOrg(){
    export CORE_PEER_LOCALMSPID="ConsumerOrgMSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_CONSUMERORG_CA
    export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/crypto-config/peerOrganizations/consumerorg.dot-box.com/users/Admin@consumerorg.dot-box.com/msp
    export CORE_PEER_ADDRESS=localhost:18051
    
}

createChannel(){
    # rm -rf ../channel-artifacts/*
    setGlobalsForPeer0ProducerOrg
    
    peer channel create -o localhost:7050 -c $CHANNEL_NAME \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    -f ../init_transactions/${CHANNEL_NAME}.tx --outputBlock ../channel-artifacts/${CHANNEL_NAME}.block \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

joinChannel(){
    setGlobalsForPeer0ProducerOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ProducerOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer0ProcessorOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block
    
    setGlobalsForPeer1ProcessorOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0RegulatorOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer1RegulatorOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0WholesaleOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer1WholesaleOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0RetailOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer1RetailOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer0ConsumerOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block

    setGlobalsForPeer1ConsumerOrg
    peer channel join -b ../channel-artifacts/$CHANNEL_NAME.block
    
}

updateAnchorPeers(){
    setGlobalsForPeer0ProducerOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
    
    setGlobalsForPeer0ProcessorOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RegulatorOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA   

    setGlobalsForPeer0WholesaleOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0RetailOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA

    setGlobalsForPeer0ConsumerOrg
    peer channel update -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com -c $CHANNEL_NAME -f ../init_transactions/${CORE_PEER_LOCALMSPID}anchors.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA
}

createChannel
joinChannel
updateAnchorPeers
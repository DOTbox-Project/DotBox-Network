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

# presetup(){
#     echo Installing dependencies ...
#     pushd ./artifacts/src/github.com/fabcar_contract_api/go
#     GO111MODULE=on go mod vendor
#     popd
#     echo Finished vendoring Go dependencies
# }
# presetup

CC_RUNTIME_LANGUAGE="node"
VERSION="6"
CC_SRC_PATH="../../../DotBox-Chaincode/dotbox-chaincode"
CC_NAME="dotbox-chaincode"

#if [[ "$1" === "src" ]]
#then
#    CC_SRC_PATH="$2"
#else
#    echo "path to chaincode not specified with src attribute"
#    exit 1
#fi
    

packageChaincode(){
    rm -rf ${CC_NAME}.tar.gz
    setGlobalsForPeer0ProducerOrg
    peer lifecycle chaincode package ../chaincode/${CC_NAME}.tar.gz --path ${CC_SRC_PATH} --lang ${CC_RUNTIME_LANGUAGE} --label ${CC_NAME}_${VERSION}
    echo "===================== Chaincode is packaged on peer0.producerorg ===================== "
}

installChaincode(){
    setGlobalsForPeer0ProducerOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.producerorg ===================== "
    
    setGlobalsForPeer0ProcessorOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.processororg ===================== "
    
    setGlobalsForPeer0RegulatorOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.regulatororg ===================== "

    setGlobalsForPeer0WholesaleOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.wholesaleorg ===================== "

    setGlobalsForPeer0RetailOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.retailorg ===================== "

    setGlobalsForPeer0ConsumerOrg
    peer lifecycle chaincode install ../chaincode/${CC_NAME}.tar.gz
    echo "===================== Chaincode is installed on peer0.consumerorg ===================== "
}

queryInstalled(){
    setGlobalsForPeer0ProducerOrg
    peer lifecycle chaincode queryinstalled >&log.txt
    cat log.txt
    PACKAGE_ID=$(sed -n "/${CC_NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
    echo PackageID is ${PACKAGE_ID}
    echo "===================== Query installed successful on peer0.producerorg on channel ===================== "
}

approveForProducerOrg(){
    setGlobalsForPeer0ProducerOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from producerorg  ===================== "
}

# --signature-policy "OR ('Org1MSP.member')"
# --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA
# --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses peer0.org2.example.com:9051 --tlsRootCertFiles $PEER0_ORG2_CA
#--channel-config-policy Channel/Application/Admins
# --signature-policy "OR ('Org1MSP.peer','Org2MSP.peer')"


checkCommitReadyness1(){
    setGlobalsForPeer0ProducerOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from producerorg ===================== "
}

approveForProcessorOrg(){
    setGlobalsForPeer0ProcessorOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from processororg ===================== "
}

checkCommitReadyness2(){
    
    setGlobalsForPeer0ProcessorOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from processororg ===================== "
}

approveForRegulatorOrg(){
    setGlobalsForPeer0RegulatorOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from regulatororg ===================== "
}

checkCommitReadyness3(){
    setGlobalsForPeer0RegulatorOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from regulatororg ===================== "
}

approveForWholesaleOrg(){
    setGlobalsForPeer0WholesaleOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from wholesaleorg ===================== "
}

checkCommitReadyness4(){
    setGlobalsForPeer0WholesaleOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from wholesaleorg ===================== "
}

approveForRetailOrg(){
    setGlobalsForPeer0RetailOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from retailorg ===================== "
}

checkCommitReadyness5(){
    setGlobalsForPeer0RetailOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from retailorg ===================== "
}

approveForConsumerOrg(){
    setGlobalsForPeer0ConsumerOrg

    peer lifecycle chaincode approveformyorg -o localhost:7050  \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --version ${VERSION} --package-id ${PACKAGE_ID} --sequence ${VERSION}

    echo "===================== chaincode approved from consumerorg ===================== "
    
}

checkCommitReadyness6(){
    setGlobalsForPeer0ConsumerOrg

    peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME \
    --name ${CC_NAME} --version ${VERSION} --sequence ${VERSION} --output json

    echo "===================== checking commit readyness from consumerorg ===================== "
}

commitChaincodeDefinition(){
    setGlobalsForPeer0ProducerOrg

    peer lifecycle chaincode commit -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED  --cafile $ORDERER_CA \
    --channelID $CHANNEL_NAME --name ${CC_NAME} \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_PRODUCERORG_CA \
    --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_PROCESSORORG_CA \
    --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_REGULATORORG_CA \
    --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_WHOLESALEORG_CA \
    --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_RETAILORG_CA \
    --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_CONSUMERORG_CA \
    --version ${VERSION} --sequence ${VERSION}
   
   echo "===================== Chaincode Definition commited on anchor peers ===================== "
}

queryCommitted(){
    setGlobalsForPeer0ProducerOrg

    peer lifecycle chaincode querycommitted --channelID $CHANNEL_NAME --name ${CC_NAME}

    
}

chaincodeInvokeInit(){
    setGlobalsForPeer0ProducerOrg

    peer chaincode query -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_PRODUCERORG_CA \
    -c '{"function":"getAllProducers","Args":[]}'
    # --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_PROCESSORORG_CA \
    # --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_REGULATORORG_CA \
    # --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_WHOLESALEORG_CA \
    # --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_RETAILORG_CA \
    # --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_CONSUMERORG_CA \
    # -c '{"function":"getAllProducers","Args":[]}'
    
}


chaincodeInvoke(){
    setGlobalsForPeer0ProducerOrg

    # Initialize Ledger
    peer chaincode invoke -o localhost:7050 \
    --ordererTLSHostnameOverride orderer.dot-box.com \
    --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA -C $CHANNEL_NAME -n ${CC_NAME} \
    --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_PRODUCERORG_CA \
    --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_PROCESSORORG_CA  \
    --peerAddresses localhost:11051 --tlsRootCertFiles $PEER0_REGULATORORG_CA  \
    --peerAddresses localhost:13051 --tlsRootCertFiles $PEER0_WHOLESALEORG_CA  \
    --peerAddresses localhost:15051 --tlsRootCertFiles $PEER0_RETAILORG_CA  \
    --peerAddresses localhost:17051 --tlsRootCertFiles $PEER0_CONSUMERORG_CA  \
    -c '{"Args":["createProducer","123","Gyabeng Elton","gyabengelton@gmail.com","password","Gyabeng Farms","Tema","02134567009"]}'
    
#     setGlobalsForPeer0Org1

#     ## Create Car
#     # peer chaincode invoke -o localhost:7050 \
#     #     --ordererTLSHostnameOverride orderer.dot-box.com \
#     #     --tls $CORE_PEER_TLS_ENABLED \
#     #     --cafile $ORDERER_CA \
#     #     -C $CHANNEL_NAME -n ${CC_NAME}  \
#     #     --peerAddresses localhost:7051 \
#     #     --tlsRootCertFiles $PEER0_ORG1_CA \
#     #     --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA $PEER_CONN_PARMS  \
#     #     -c '{"function": "CreateCar","Args":["Car-ABCDEEE", "Audi", "R8", "Red", "Pavan"]}'
    
#     ## Change car owner
#     peer chaincode invoke -o localhost:7050 \
#         --ordererTLSHostnameOverride orderer.dot-box.com \
#         --tls $CORE_PEER_TLS_ENABLED \
#         --cafile $ORDERER_CA \
#         -C $CHANNEL_NAME -n ${CC_NAME}  \
#         --peerAddresses localhost:7051 \
#         --tlsRootCertFiles $PEER0_ORG1_CA \
#         --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA $PEER_CONN_PARMS  \
#         -c '{"function": "ChangeCarOwner","Args":["Car-ABCDEEE", "Sandip"]}'
}

# chaincodeQuery(){
#     setGlobalsForPeer0Org1

#     # Query all Cars
#     peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryAllCars"]}'

#     # Query by Car id
#     peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} -c '{"Args":["queryCar", "Car-ABCDEEE"]}'
# }

packageChaincode
installChaincode
queryInstalled
approveForProducerOrg
# checkCommitReadyness1
approveForProcessorOrg
# checkCommitReadyness2
approveForRegulatorOrg
# checkCommitReadyness3
approveForWholesaleOrg
# checkCommitReadyness4
approveForRetailOrg
# checkCommitReadyness5
approveForConsumerOrg
# checkCommitReadyness6
commitChaincodeDefinition
queryCommitted
# chaincodeInvokeInit
# chaincodeInvoke
# chaincodeQuery

# setGlobalsForOrderer
# setGlobalsForPeer0ConsumerOrg
# setGlobalsForPeer0ProcessorOrg
# setGlobalsForPeer0RegulatorOrg
# setGlobalsForPeer0RetailOrg
# setGlobalsForPeer0ProducerOrg
# setGlobalsForPeer0WholesaleOrg
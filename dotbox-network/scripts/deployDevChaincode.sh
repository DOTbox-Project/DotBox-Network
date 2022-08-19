export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=/home/shikamaru/Documents/Projects/Final-Year-Project/DotBox-Network/dotbox-network/scripts/../organizations/crypto-config/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/tlscacerts/tlsca.dot-box.com-cert.pem
export PEER0_PRODUCERORG_CA=/home/shikamaru/Documents/Projects/Final-Year-Project/DotBox-Network/dotbox-network/scripts/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/ca.crt
export FABRIC_CFG_PATH=/home/shikamaru/Documents/Projects/Final-Year-Project/DotBox-Network/dotbox-network/scripts/../config/
export CORE_PEER_LOCALMSPID=ProducerOrgMSP
export CORE_PEER_TLS_ROOTCERT_FILE=/home/shikamaru/Documents/Projects/Final-Year-Project/DotBox-Network/dotbox-network/scripts/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/home/shikamaru/Documents/Projects/Final-Year-Project/DotBox-Network/dotbox-network/scripts/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/users/Admin@producerorg.dot-box.com/msp
export CORE_PEER_ADDRESS=localhost:7051

#peer lifecycle chaincode package ../test.tar.gz --path ../../../DotBox-Chaincode/dotbox-chaincode --lang node --label test

#peer lifecycle chaincode install ../test.tar.gz

#peer lifecycle chaincode queryinstalled

#peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com --channelID channel1 --name test --version 1.0 --package-id $CC_PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA

#peer lifecycle chaincode checkcommitreadiness --channelID channel1 --name test --version 1.0 --sequence 1 --tls --cafile $ORDERER_CA

#peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.dot-box.com --channelID channel1 --name test --version 1.0 --sequence 1 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/../organizations/crypto-config/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/ca.crt"


#!/bin/bash

function createProducerOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/producerorg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --caname ca-producerorg --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-producerorg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-producerorg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-producerorg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-producerorg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-producerorg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  # infoln "Registering peer1"
  # set -x
  # fabric-ca-client register --caname ca-producerorg --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  # { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-producerorg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-producerorg --id.name producerorgadmin --id.secret producerorgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --caname ca-producerorg -M ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/msp --csr.hosts peer0.producerorg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  # infoln "Generating the peer1 msp"
  # set -x
  # fabric-ca-client enroll -u https://peer1:peer1pw@localhost:7055 --caname ca-producerorg -M ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer1.producerorg.dot-box.com/msp --csr.hosts peer1.producerorg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  # { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --caname ca-producerorg -M ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.producerorg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/tlsca/tlsca.producerorg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/peers/peer0.producerorg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/ca/ca.producerorg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:7054 --caname ca-producerorg -M ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/users/User1@producerorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/users/User1@producerorg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://producerorgadmin:producerorgadminpw@localhost:7054 --caname ca-producerorg -M ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/users/Admin@producerorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/producerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/producerorg.dot-box.com/users/Admin@producerorg.dot-box.com/msp/config.yaml
}

function createProcessorOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/processororg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/processororg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:8054 --caname ca-processororg --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-processororg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-processororg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-processororg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-processororg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-processororg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-processororg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-processororg --id.name processororgadmin --id.secret processororgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:8054 --caname ca-processororg -M ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/msp --csr.hosts peer0.processororg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:8054 --caname ca-processororg -M ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.processororg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/tlsca/tlsca.processororg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/peers/peer0.processororg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/ca/ca.processororg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:8054 --caname ca-processororg -M ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/users/User1@processororg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/users/User1@processororg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://processororgadmin:processororgadminpw@localhost:8054 --caname ca-processororg -M ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/users/Admin@processororg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/processororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/processororg.dot-box.com/users/Admin@processororg.dot-box.com/msp/config.yaml
}

function createRegulatorOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/regulatororg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:9054 --caname ca-regulatororg --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-regulatororg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-regulatororg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-regulatororg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-regulatororg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-regulatororg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-regulatororg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-regulatororg --id.name regulatororgadmin --id.secret regulatororgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:9054 --caname ca-regulatororg -M ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/msp --csr.hosts peer0.regulatororg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:9054 --caname ca-regulatororg -M ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.regulatororg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/tlsca/tlsca.regulatororg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/peers/peer0.regulatororg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/ca/ca.regulatororg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:9054 --caname ca-regulatororg -M ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/users/User1@regulatororg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/users/User1@regulatororg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://regulatororgadmin:regulatororgadminpw@localhost:9054 --caname ca-regulatororg -M ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/users/Admin@regulatororg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/regulatororg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/regulatororg.dot-box.com/users/Admin@regulatororg.dot-box.com/msp/config.yaml
}

function createWholesaleOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/wholesaleorg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:10054 --caname ca-wholesaleorg --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-wholesaleorg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-wholesaleorg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-wholesaleorg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-wholesaleorg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-wholesaleorg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-wholesaleorg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-wholesaleorg --id.name wholesaleorgadmin --id.secret wholesaleorgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:10054 --caname ca-wholesaleorg -M ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/msp --csr.hosts peer0.wholesaleorg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:10054 --caname ca-wholesaleorg -M ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.wholesaleorg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/tlsca/tlsca.wholesaleorg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/peers/peer0.wholesaleorg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/ca/ca.wholesaleorg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:10054 --caname ca-wholesaleorg -M ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/users/User1@wholesaleorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/users/User1@wholesaleorg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://wholesaleorgadmin:wholesaleorgadminpw@localhost:10054 --caname ca-wholesaleorg -M ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/users/Admin@wholesaleorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/wholesaleorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/wholesaleorg.dot-box.com/users/Admin@wholesaleorg.dot-box.com/msp/config.yaml
}

function createRetailOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/retailorg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:11054 --caname ca-retailorg --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-retailorg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-retailorg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-retailorg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-retailorg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-retailorg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-retailorg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-retailorg --id.name retailorgadmin --id.secret retailorgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:11054 --caname ca-retailorg -M ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/msp --csr.hosts peer0.retailorg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:11054 --caname ca-retailorg -M ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.retailorg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/tlsca/tlsca.retailorg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/peers/peer0.retailorg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/ca/ca.retailorg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:11054 --caname ca-retailorg -M ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/users/User1@retailorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/users/User1@retailorg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://retailorgadmin:retailorgadminpw@localhost:11054 --caname ca-retailorg -M ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/users/Admin@retailorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/retailorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/retailorg.dot-box.com/users/Admin@retailorg.dot-box.com/msp/config.yaml
}

function createConsumerOrg() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/peerOrganizations/consumerorg.dot-box.com/

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:12054 --caname ca-consumerorg --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-12054-ca-consumerorg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-12054-ca-consumerorg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-12054-ca-consumerorg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-12054-ca-consumerorg.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/config.yaml

  infoln "Registering peer0"
  set -x
  fabric-ca-client register --caname ca-consumerorg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-consumerorg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-consumerorg --id.name consumerorgadmin --id.secret consumerorgadminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:12054 --caname ca-consumerorg -M ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/msp --csr.hosts peer0.consumerorg.dot-box.com --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:12054 --caname ca-consumerorg -M ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.consumerorg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/signcerts/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/keystore/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir -p ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/tlsca
  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/tlsca/tlsca.consumerorg.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/ca
  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/peers/peer0.consumerorg.dot-box.com/msp/cacerts/* ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/ca/ca.consumerorg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
  fabric-ca-client enroll -u https://user1:user1pw@localhost:12054 --caname ca-consumerorg -M ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/users/User1@consumerorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/users/User1@consumerorg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
  fabric-ca-client enroll -u https://consumerorgadmin:consumerorgadminpw@localhost:12054 --caname ca-consumerorg -M ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/users/Admin@consumerorg.dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/consumerorg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/msp/config.yaml ${PWD}/organizations/peerOrganizations/consumerorg.dot-box.com/users/Admin@consumerorg.dot-box.com/msp/config.yaml
}



function createOrderer() {
  infoln "Enrolling the CA admin"
  mkdir -p organizations/ordererOrganizations/dot-box.com

  export FABRIC_CA_CLIENT_HOME=${PWD}/organizations/ordererOrganizations/dot-box.com

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:13054 --caname ca-orderer --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-13054-ca-orderer.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-13054-ca-orderer.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-13054-ca-orderer.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-13054-ca-orderer.pem
    OrganizationalUnitIdentifier: orderer' >${PWD}/organizations/ordererOrganizations/dot-box.com/msp/config.yaml

  infoln "Registering orderer"
  set -x
  fabric-ca-client register --caname ca-orderer --id.name orderer --id.secret ordererpw --id.type orderer --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the orderer admin"
  set -x
  fabric-ca-client register --caname ca-orderer --id.name ordererAdmin --id.secret ordererAdminpw --id.type admin --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the orderer msp"
  set -x
  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:13054 --caname ca-orderer -M ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp --csr.hosts orderer.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/msp/config.yaml ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/config.yaml

  infoln "Generating the orderer-tls certificates"
  set -x
  fabric-ca-client enroll -u https://orderer:ordererpw@localhost:13054 --caname ca-orderer -M ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls --enrollment.profile tls --csr.hosts orderer.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/ca.crt
  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/signcerts/* ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/server.crt
  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/keystore/* ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/server.key

  mkdir -p ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/msp/tlscacerts/tlsca.dot-box.com-cert.pem

  mkdir -p ${PWD}/organizations/ordererOrganizations/dot-box.com/msp/tlscacerts
  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/orderers/orderer.dot-box.com/tls/tlscacerts/* ${PWD}/organizations/ordererOrganizations/dot-box.com/msp/tlscacerts/tlsca.dot-box.com-cert.pem

  infoln "Generating the admin msp"
  set -x
  fabric-ca-client enroll -u https://ordererAdmin:ordererAdminpw@localhost:13054 --caname ca-orderer -M ${PWD}/organizations/ordererOrganizations/dot-box.com/users/Admin@dot-box.com/msp --tls.certfiles ${PWD}/organizations/fabric-ca/ordererOrg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/organizations/ordererOrganizations/dot-box.com/msp/config.yaml ${PWD}/organizations/ordererOrganizations/dot-box.com/users/Admin@dot-box.com/msp/config.yaml
}

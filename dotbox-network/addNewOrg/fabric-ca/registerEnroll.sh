#!/bin/bash
#
# Copyright IBM Corp All Rights Reserved
#
# SPDX-License-Identifier: Apache-2.0
#

function createNewOrg {
	infoln "Enrolling the CA admin"
	mkdir -p ../organizations/peerOrganizations/neworg.dot-box.com/

	export FABRIC_CA_CLIENT_HOME=${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/

  set -x
  fabric-ca-client enroll -u https://admin:adminpw@localhost:14054 --caname ca-neworg --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-14054-ca-neworg.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-14054-ca-neworg.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-14054-ca-neworg.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-14054-ca-neworg.pem
    OrganizationalUnitIdentifier: orderer' > ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/config.yaml

	infoln "Registering peer0"
  set -x
	fabric-ca-client register --caname ca-neworg --id.name peer0 --id.secret peer0pw --id.type peer --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering user"
  set -x
  fabric-ca-client register --caname ca-neworg --id.name user1 --id.secret user1pw --id.type client --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Registering the org admin"
  set -x
  fabric-ca-client register --caname ca-neworg --id.name neworgadmin --id.secret neworgadminpw --id.type admin --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  infoln "Generating the peer0 msp"
  set -x
	fabric-ca-client enroll -u https://peer0:peer0pw@localhost:14054 --caname ca-neworg -M ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/msp --csr.hosts peer0.neworg.dot-box.com --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/config.yaml ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/msp/config.yaml

  infoln "Generating the peer0-tls certificates"
  set -x
  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:14054 --caname ca-neworg -M ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls --enrollment.profile tls --csr.hosts peer0.neworg.dot-box.com --csr.hosts localhost --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null


  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/tlscacerts/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/ca.crt
  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/signcerts/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/server.crt
  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/keystore/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/server.key

  mkdir ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/tlscacerts
  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/tlscacerts/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/tlscacerts/ca.crt

  mkdir ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/tlsca
  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/tls/tlscacerts/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/tlsca/tlsca.neworg.dot-box.com-cert.pem

  mkdir ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/ca
  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/peers/peer0.neworg.dot-box.com/msp/cacerts/* ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/ca/ca.neworg.dot-box.com-cert.pem

  infoln "Generating the user msp"
  set -x
	fabric-ca-client enroll -u https://user1:user1pw@localhost:14054 --caname ca-neworg -M ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/users/User1@neworg.dot-box.com/msp --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/config.yaml ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/users/User1@neworg.dot-box.com/msp/config.yaml

  infoln "Generating the org admin msp"
  set -x
	fabric-ca-client enroll -u https://neworgadmin:neworgadminpw@localhost:14054 --caname ca-neworg -M ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/users/Admin@neworg.dot-box.com/msp --tls.certfiles ${PWD}/fabric-ca/neworg/tls-cert.pem
  { set +x; } 2>/dev/null

  cp ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/msp/config.yaml ${PWD}/../organizations/peerOrganizations/neworg.dot-box.com/users/Admin@neworg.dot-box.com/msp/config.yaml
}

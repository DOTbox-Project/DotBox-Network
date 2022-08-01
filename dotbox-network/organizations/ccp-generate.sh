#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}

ORG=ProducerOrg
P0PORT=7051
CAPORT=7054
PEERPEM=organizations/peerOrganizations/producerorg.dot-box.com/tlsca/tlsca.producerorg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/producerorg.dot-box.com/ca/ca.producerorg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/producerorg.dot-box.com/connection-producerorg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/producerorg.dot-box.com/connection-producerorg.yaml

ORG=ProcessorOrg
P0PORT=8051
CAPORT=8054
PEERPEM=organizations/peerOrganizations/processororg.dot-box.com/tlsca/tlsca.processororg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/processororg.dot-box.com/ca/ca.processororg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/processororg.dot-box.com/connection-processororg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/processororg.dot-box.com/connection-processororg~.yaml

ORG=RegulatorOrg
P0PORT=9051
CAPORT=9054
PEERPEM=organizations/peerOrganizations/regulatororg.dot-box.com/tlsca/tlsca.regulatororg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/regulatororg.dot-box.com/ca/ca.regulatororg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/regulatororg.dot-box.com/connection-regulatororg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/regulatororg.dot-box.com/connection-regulatororg~.yaml

ORG=WholesaleOrg
P0PORT=10051
CAPORT=10054
PEERPEM=organizations/peerOrganizations/wholesaleorg.dot-box.com/tlsca/tlsca.wholesaleorg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/wholesaleorg.dot-box.com/ca/ca.wholesaleorg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/wholesaleorg.dot-box.com/connection-wholesaleorg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/wholesaleorg.dot-box.com/connection-wholesaleorg~.yaml

ORG=RetailOrg
P0PORT=11051
CAPORT=11054
PEERPEM=organizations/peerOrganizations/retailorg.dot-box.com/tlsca/tlsca.retailorg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/retailorg.dot-box.com/ca/ca.retailorg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/retailorg.dot-box.com/connection-retailorg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/retailorg.dot-box.com/connection-retailorg~.yaml

ORG=ConsumerOrg
P0PORT=12051
CAPORT=12054
PEERPEM=organizations/peerOrganizations/consumerorg.dot-box.com/tlsca/tlsca.consumerorg.dot-box.com-cert.pem
CAPEM=organizations/peerOrganizations/consumerorg.dot-box.com/ca/ca.consumerorg.dot-box.com-cert.pem

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/consumerorg.dot-box.com/connection-consumerorg.json
echo "$(yaml_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM)" > organizations/peerOrganizations/consumerorg.dot-box.com/connection-consumerorg~.yaml

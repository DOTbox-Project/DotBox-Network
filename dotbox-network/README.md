# DotBox-Network
Follow the steps below to setup the dotbox-network
1. cd into the scripts directory
2. Run ./createCryptoIdentities.sh
3. Run ./createChannelArtifacts.sh
4. cd into docker directory
5. Run docker-compose up -d
6. cd into the scripts directory
7. Run ./createChannel.sh
8. To verify that the channel was created and peers have joined:
    Run docker exec -it peer0.producerorg.dot-box.com
    peer channel list
    The above command should display channel1
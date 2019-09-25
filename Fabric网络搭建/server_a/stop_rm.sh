docker stop $(docker ps -aq)
docker rm $(docker ps -a -q)
docker volume  prune
#docker rmi -f $(docker images -q)
echo /etc/hyperledger/fabric-ca-server-config/$(cd crypto-config/peerOrganizations/org1.example.com/ca && ls *_sk)

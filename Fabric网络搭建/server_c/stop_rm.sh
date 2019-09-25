docker stop $(docker ps -aq)
docker rm $(docker ps -a -q)
docker volume  prune
#docker rmi -f $(docker images -q)

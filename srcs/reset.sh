docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -qa)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q) 2>/dev/null
rm -rf /home/fschuber/data
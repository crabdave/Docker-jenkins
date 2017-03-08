# Docker-jenkins

download jenkins from https://jenkins.io/

主要提供nodejs4.7环境编译


docker-compose up -d

docker logs --tail 100 -f jenkins_jenkins_1

docker exec -it jenkins_jenkins_1 /bin/bash

docker build -t myjenkins .




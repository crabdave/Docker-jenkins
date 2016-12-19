# Docker-jenkins

download jenkins from https://jenkins.io/


docker build -t jenkins .


docker run -d -e "container=container-jenkins" --name container-jenkins -h container-jenkins -p 7000:8080 -p 50000:50000 jenkins


docker logs --tail 100 -f container-jenkins

docker stop container-jenkins

docker rm container-jenkins

docker exec -it container-jenkins /bin/bash



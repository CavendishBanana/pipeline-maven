#!/bin/bash
echo "Building the code"
#WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
WORKSPACE="/var/jenkins_home/workspace/pipeline-docker-maven"
#WORKSPACE="/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
#this is some comment but modified 
whoami
echo "working directory: $(pwd)"


#--mount type=bind,source="$(pwd)"/target,target=/app
#docker run --rm -v "$WORKSPACE/java-app/:/app" -v "/root/.m2:/root/.m2/" -w "/app" "maven:3.9.6-eclipse-temurin-17-alpine" "$@"

#docker run --rm --mount type=bind,source="$WORKSPACE/java-app/",target="/app" --mount type=bind,source="/root/.m2",target="/root/.m2/" -w "/app" "maven:3.9.6-eclipse-temurin-17-alpine" "$@"

docker run -it -d --name maven-alpine "maven:3.9.6-eclipse-temurin-17-alpine"  bash
docker exec -d -it maven-alpine mkdir "/app"
#docker exec -d -it maven-alpine cd "/app"
docker cp $WORKSPACE/java-app/ maven-alpine:/app/
docker exec -d -it -w /app maven-alpine mvn -B -Dskiptests clean package
docker cp maven-alpine:/app $WORKSPACE/java-app
docker cp maven-alpine:/root/.m2 /root/.m2
docker stop maven-alpine
docker rm maven-alpine
echo "build mvn done"



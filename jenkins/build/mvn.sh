#!/bin/bash
echo "Building the code"
#WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
WORKSPACE="/var/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
#this is some comment
whoami
ls $WORKSPACE/java-app
docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2:/root/.m2/ -w /app maven:3.9.6-eclipse-temurin-17-alpine "$@"

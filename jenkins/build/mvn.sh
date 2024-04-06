#!/bin/bash
echo "Building the code"
WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
whoami
ls $WORKSPACE/java-app
docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2:/root/.m2/ -w /app maven:3.9.6-eclipse-temurin-17-alpine "$@"

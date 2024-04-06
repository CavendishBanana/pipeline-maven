#!/bin/bash

echo "Testing the code"

WORKSPACE=/home/gryko/jenkins-data/jenkins_home/workspace/pipeline-docker-maven

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2:/root/.m2/ -w /app maven:3.9.6-eclipse-temurin-17-alpine "$@"

#!/bin/bash
echo "Building the code"
#WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
WORKSPACE="/var/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
#this is some comment but modified 
whoami
echo "working directory: $(pwd)"
ls -la "$(pwd)"
docker run --rm -v $WORKSPACE/java-app/:/app --mount type=bind,source=/root/.m2,target=/root/.m2/ -w /app grosmichelbanana/maven-alpine:v.1 ls -la

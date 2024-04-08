#!/bin/bash
echo "Building the code"
#WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
WORKSPACE="/var/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
#this is some comment but modified 
whoami
echo "working directory: $(pwd)"
ls -la "$(pwd)"
docker run --rm --mount type=volume,source=jenkins-volume-pipeline-docker-maven,target=/app --mount type=bind,source=/root/.m2,target=/root/.m2/ -w /app/java-app/ grosmichelbanana/maven-alpine:v.1 ls -la

#!/bin/bash
echo "Building the code"
WORKSPACE="/home/$(whoami)/jenkins-data/jenkins_home/workspace/pipeline-docker-maven"
#WORKSPACE="/var/jenkins_home/workspace/pipeline-docker-maven"
echo "WORKSPACE: $WORKSPACE"
#this is some comment but modified 
whoami
echo "working directory: $(pwd)"

docker run --rm --mount type=bind,source="$WORKSPACE/java-app/",target="/app" --mount type=bind,source="/root/.m2",target="/root/.m2/" -w "/app" "grosmichelbanana/maven-alpine:v.1" "$@"

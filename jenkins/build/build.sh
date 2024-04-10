#!/bin/bash

echo "******** Building docker image ********"

cp -f /app/target/*.jar jenkins/build/
cp -f /app/target/*.jar /var/jenkins_home/workspace/pipeline-docker-maven/
cd jenkins/build/ && docker compose -f docker-compose-build.yml build --no-cache

echo "******** Building docker image done *********"

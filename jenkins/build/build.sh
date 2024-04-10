#!/bin/bash

echo "******** Building docker image ********"

cp -f /app/target/*.jar jenkins/build/

cd jenkins/build/ && docker compose -f docker-compose-build.yml build --no-cache

echo "******** Building docker image done *********"

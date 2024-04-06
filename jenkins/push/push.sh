#!/bin/bash

echo "Pushing image"

IMAGE="maven-project"

echo "Logging in"

docker login -u grosmichelbanana -p $PASS 

echo "Tagging image"

docker tag $IMAGE:$BUILD_TAG grosmichelbanana/$IMAGE:$BUILD_TAG
echo "Pushing image"
docker push grosmichelbanana/$IMAGE:$BUILD_TAG


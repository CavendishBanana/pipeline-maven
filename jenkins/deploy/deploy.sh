#!/bin/bash

echo "maven-project" > /tmp/.auth
echo "$BUILD_TAG" >> /tmp/.auth
echo "$PASS" >> /tmp/.auth
echo "The build tag is: $BUILD_TAG"
scp -i /opt/production /tmp/.auth prod-user@$PROD_MACHINE_IP:/tmp/.auth
scp -i /opt/production jenkins/deploy/publish.sh prod-user@$PROD_MACHINE_IP:/tmp/publish.sh
ssh -i /opt/production prod-user@$PROD_MACHINE_IP "/tmp/publish.sh"


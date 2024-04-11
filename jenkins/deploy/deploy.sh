#!/bin/bash

echo "maven-project" > /tmp/.auth
echo "$BUILD_TAG" >> /tmp/.auth
echo "$PASS" >> /tmp/.auth
echo "The build tag is: $BUILD_TAG"
ls -la
pwd
PROD_MACHINE_IP=$1
echo $PROD_MACHINE_IP
scp -i /opt2/production /tmp/.auth prod-user@$PROD_MACHINE_IP:/tmp/.auth
scp -i /opt2/production jenkins/deploy/publish.sh prod-user@$PROD_MACHINE_IP:/tmp/publish.sh
ssh -i /opt2/production prod-user@$PROD_MACHINE_IP "/tmp/publish.sh"


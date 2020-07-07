#!/bin/bash -e

echo "============================================================"
echo "Manually Build and Push
Usage :
 from root of this repository
 ./manual_build_push.sh
"
echo "============================================================"
docker build -t us.gcr.io/zenhub-ops/camo:latest .

echo ""
echo "============================================================"
echo "Need to be looged in to zenhub-ops, trying to activate the 'ops' configuration"
echo "============================================================"
gcloud config configurations activate ops

echo ""
echo "============================================================"
echo "docker login"
echo "============================================================"
gcloud -q auth configure-docker us.gcr.io

echo ""
echo "============================================================"
echo "docker push"
echo "============================================================"
docker push us.gcr.io/zenhub-ops/camo:latest

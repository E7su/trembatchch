#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile --build-arg TELEGRAM_TOKEN=$TELEGRAM_TOKEN -t e7su/trembatchch:$TAG .
docker push e7su/trembatchch


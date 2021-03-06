#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku plugins:install heroku-container-registry
docker login -u _ --password=$HEROKU_API_KEY registry.heroku.com
heroku container:push worker --app $HEROKU_APP_NAME
heroku container:release worker --app $HEROKU_APP_NAME

#!/bin/bash
set -e

TEST_PWD=`pwd`
DC_SENTRY="sentry-docker-9x"
DC_PROJ_NAME=$DC_SENTRY"-e2e"
SENTRY_COMPOSE="docker-compose -f ../$DC_SENTRY/docker-compose.yml -f ../$DC_SENTRY/docker-compose-e2e.yml "


sentry_compose_cleanup () {
    #cleanup sentry with compose
    $SENTRY_COMPOSE down

    # remove volumes
    docker volume ls | grep sentry | awk -F' ' '{print "docker volume rm "$2}' | bash
}

sentry_compose_cleanup

# install sentry for running the e2e suite
cd ../$DC_SENTRY
./install-noinput.sh
cd $TEST_PWD

$SENTRY_COMPOSE up -d

docker-compose down
docker-compose up --exit-code-from selenium_test --build

sentry_compose_cleanup
#!/bin/bash

cd /home/ro-dou/ro-dou-jobs

docker compose down

git pull

docker compose up -d --pull=true --force-recreate
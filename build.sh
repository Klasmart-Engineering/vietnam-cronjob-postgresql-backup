#!/bin/bash
set -e

echo Build docker image
docker build -t 942095822719.dkr.ecr.eu-west-2.amazonaws.com/kidsloop-cronjob-postgresql-backup:latest .

echo Docker login and push
aws ecr get-login-password --profile=kl_gl | docker login --username AWS --password-stdin 942095822719.dkr.ecr.eu-west-2.amazonaws.com
docker push 942095822719.dkr.ecr.eu-west-2.amazonaws.com/kidsloop-cronjob-postgresql-backup:latest
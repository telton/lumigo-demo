#!/bin/bash

if [[ -z $GITHUB_SHA ]]; then
  GITHUB_SHA=$(git rev-parse --short HEAD^)
fi

account=$(aws sts get-caller-identity --query "Account" --output text)
region="${AWS_REGION:-us-east-1}"
stage=${1:-dev}

cluster="demo-express-${stage}-cluster"
service="demo-express-${stage}-service"

commitTag="${account}.dkr.ecr.us-east-1.amazonaws.com/demo-express:${GITHUB_SHA}"
latestTag="${account}.dkr.ecr.us-east-1.amazonaws.com/demo-express:latest"

echo "Commit Tag: ${commitTag}"
echo "Latest Tag: ${latestTag}"

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin "${account}.dkr.ecr.us-east-1.amazonaws.com"

# tag the build with both the commit and latest tags and push to ecr
docker build . -f ./Dockerfile -t $commitTag -t $latestTag
docker push $latestTag

# force the scheduler to do a new rolling blue/green deployment using the min and max healthy percentage defined on the service (leaving us with no downtime)
echo "updating service ${service} on cluster ${cluster}..."
aws ecs update-service --cluster ${cluster} --service ${service} --region ${region} --force-new-deployment

# Demo Fastify App

This service is to demonstrate Lumigo's tracing capabilities within a Fastify application

## To Run the Service Locally

```bash
$ npm ci

$ npm start
```

## Deploy CloudFormation

```bash
$ aws cloudformation deploy --template-file demo-fastify.yml --stack-name demo-fastify --parameter-overrides stage=dev --capabilities CAPABILITY_NAMED_IAM
```

## Deploy Docker Container

```bash
$ ./deploy dev
```
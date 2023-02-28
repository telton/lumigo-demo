# Demo Express App

This service is to demonstrate Lumigo's tracing capabilities within an Express application

## To Run the Service Locally

```bash
$ npm ci

$ npm start
```

## Deploy CloudFormation

```bash
$ aws cloudformation deploy --template-file demo-express.yml --stack-name demo-express --parameter-overrides stage=dev --capabilities CAPABILITY_NAMED_IAM
```

## Deploy Docker Container

```bash
$ ./deploy dev
```
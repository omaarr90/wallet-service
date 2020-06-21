<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.2-brightgreen.svg" alt="Swift 5.2">
    </a>
</p>  

![test](https://github.com/one-wallet/wallet-service/workflows/test/badge.svg)

## Run Docker Image Locally:  

### Build Image:  
```docker build --file web.Dockerfile -t wallet-service-swift-app . ```  

### List Images:  
```docker images```  

### Run container:  
take image id from the list and then run below which map the host port 3000 to container port 80:  
```docker run -p 3000:80 {image-id}```  

### List Docker Container:  
```docker container ls```

### Stop Docker Container:  
```docker stop {container-id}```  


## Setup AWS ECS(Container Service) from Console:  
Create User with Programmatic access and attach AmazonEC2ContainerRegistryPowerUser(AWS managed policy), save the csv file which contain access-key and secret-key

### Create Cluster:  
A cluster is the place where AWS containers run. They use configurations similar to EC2 instances. Define the following:

- Cluster template: EC2 Linux + Networking
- Cluster name: wallet-service-swift-app-dev-cluster
- EC2 instance type: t2.micro
- Number of instances: 1
- EBS storage: 30
- Key pair: None
- VPC: New

When the process is complete, you may choose to click on “View cluster.”

### Create Repository from AWS Console:  
Create a new repository and enter a name (preferably with the same container name as in your local dev environment for consistency).

### Create Task Definition from AWS Console:  
skip it, this to be done once
Tasks function like the docker run command of the Docker CLI but for multiple containers. They define:
- Container images (to use)
- Volumes (if any)
- Networks Environment variables
- Port mappings

Set a task name and use the following steps:
- launch type compatibility: EC2
- name: wallet-service-swift-app-task-def
- Add Container: wallet-service-swift-app (the one we pushed).(container name)
- Image: the URL to your container. Mine is 463141821594.dkr.ecr.us-east-1.amazonaws.com/wallet-service-swift-app:latest
- Soft limit: 512
- Map 80 (host) to 80 (container) for wallet-service-swift-app
- Env Variables:


### Create a service to run it:  
skip it, this to be done once
Go to Task Definition > click wallet-service-swift-app > click on the latest revision.
Inside of the task definition, click on the actions dropdown and select Create servcie
- Launch type: EC2
- Service name: wallet-service-swift-app-service
- Number of tasks: 1
- Task Definition: wallet-service-swift-app-task-def
- Minimum healthy percent: 0
- Maximum percent: 200

Skip through options and click Create service and View service.

You’ll see its status as PENDING. Give it a little time and it will indicate RUNNING.

Go to Cluster (through a link from the service we just created) > EC2 instances > Click on the container instance to reveal the public DNS.
Visit the public DNS to view our app


## Deploy to AWS:  

Prerequisite:
- Repository created in ECR
- Download aws cli version 2

### Configure cli with credentials:  
run ```aws configure```
will ask for access-key and secret-key which is created when creating the user.

### Login to Aws Registry:
```aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 463141821594.dkr.ecr.us-east-1.amazonaws.com```  
Should output: >Login Succeeded

### Build docker image:
```docker build --file web.Dockerfile -t wallet-service-swift-app . ```  

### Tag Image:
```docker tag wallet-service-swift-app:latest 463141821594.dkr.ecr.us-east-1.amazonaws.com/wallet-service-swift-app:latest```

### Push Image to Aws registry:
```docker push 463141821594.dkr.ecr.us-east-1.amazonaws.com/wallet-service-swift-app:latest```

### Force deployment
```aws ecs update-service --cluster wallet-service-swift-app-dev-cluster --service wallet-service-swift-app-service --force-new-deployment --region us-east-1```


## Service Url:  
Bahrin dev: http://ec2-15-185-192-3.me-south-1.compute.amazonaws.com

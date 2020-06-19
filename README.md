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
        <img src="http://img.shields.io/badge/swift-5.1-brightgreen.svg" alt="Swift 5.1">
    </a>
</p>  

![test](https://github.com/one-wallet/wallet-service/workflows/test/badge.svg)

## Run Docker Image:  

### Build Image:  
```docker build --file web.Dockerfile -t wallet-service-swift-app . ```  

### List Images:  
```docker images```  

### Copy the image Id. To run the container, we write on the terminal, map port 3000 of the machine to port 80 of the container port of:  
```docker run -p 3000:80 {image-id}```  

### List Docker Container:  
```docker container ls```

### Stop Docker Container:  
```docker stop {container-id}```  

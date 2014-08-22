# Docker NodeJS and ExpressJS Example

## Configure Your Application

Copy the Dockerfile into the root directory of your project. Modify the exposed port if required. The default exposed port is 3000.

## Example

First you need to build the container for your application. The Dockerfile in the root of your application will pull the base image (Dockerfile/nodejs), install NPM packages and expose port 3000.

    bash-3.2$ docker build -t docker-node-example github.com/BenHall/docker-node-example
    
Start the container and bind an externally accessible port to your new container
    
	bash-3.2$ docker run -p 46169:3000 -d docker-node-example
    
You will then be able to access your ExpressJS application inside a Docker container
    
	bash-3.2$ curl -i http://192.168.59.103:46169
        HTTP/1.1 200 OK
        X-Powered-By: Express
        Content-Type: text/html; charset=utf-8
        Content-Length: 170
        ETag: "1827834703"
        Date: Fri, 22 Aug 2014 15:32:50 GMT
        Connection: keep-alive
        
        <!DOCTYPE html><html><head><title>Express</title><link rel="stylesheet" href="/stylesheets/style.css"></head><body><h1>Express</h1><p>Welcome to Express</p></body></html>bash-3.2$ 
        
            
To deploy new code changes you will need to build and run a new container

## Help
Tweet me at [@Ben_Hall](http://twitter.com/ben_hall)
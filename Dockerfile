# Deploy Node App to Docker

# Pull baes image
FROM dockerfile/nodejs

MAINTAINER Ben Hall <Ben@BenHall.me.uk>

# http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app

WORKDIR /opt/app
COPY . /opt/app

EXPOSE 3000

CMD ["./bin/www"]



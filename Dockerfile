FROM ubuntu:14.04
MAINTAINER Timo Derstappen <timo@giantswarm.io>

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update && apt-get -y install nodejs
RUN apt-get update && apt-get -y install python

RUN npm install -g hubot coffee-script
RUN hubot --create /hubot
RUN cd /hubot && npm install hubot-slack --save

WORKDIR /hubot
ENTRYPOINT ["bin/hubot", "--adapter", "slack"]

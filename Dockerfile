FROM ubuntu:latest
MAINTAINER swetscha bla@blub.tschip

RUN apt-get update && apt-get -y install \ 
    curl \
    nodejs \
    npm \
    build-essential

# app dir
WORKDIR  /usr/src/snore/app

# install node js
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh

RUN mkdir -p /usr/src/snore/app
COPY . /usr/src/snore/app


RUN npm install
EXPOSE 8080
CMD ["npm", "start"]

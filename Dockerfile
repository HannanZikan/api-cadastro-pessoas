FROM node:21-alpine3.19

# create destination directory
RUN mkdir -p /usr/src/api-cadastro-pessoas
WORKDIR /usr/src/api-cadastro-pessoas

# Update and install dependency
RUN apk update && apk upgrade
RUN apk add git
# docker-compose bash command dependency
RUN apk add bash

RUN rm -rf ./node_modules
RUN rm -rf package-lock.json

# Install app dependencies
COPY ./package.json .
RUN npm install

# Bundle app source
COPY . .

# run
CMD npm start
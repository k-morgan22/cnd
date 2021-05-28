FROM node:16.2.0-alpine3.13

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

USER node

COPY --chown=node:node . /usr/src/app

CMD [ "npm", "start"]
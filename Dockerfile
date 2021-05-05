FROM node:alpine3.13

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080


USER node

COPY --chown=node:node . /usr/src/app

CMD [ "node", "server.js" ]
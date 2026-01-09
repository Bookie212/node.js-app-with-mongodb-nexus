FROM node:24-alpine

RUN  addgroup -S app && adduser -S app -G app

WORKDIR /home/app

COPY package*.json ./

RUN npm install 

COPY . .

USER app

EXPOSE 3000
CMD ["node", "server.js"]
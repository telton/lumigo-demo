FROM node:18.12

WORKDIR /opt/app

COPY package*.json ./
COPY app.js ./

RUN chown -R node:node /opt/app

USER node

RUN npm ci

EXPOSE 8080

CMD ["npm", "start"]

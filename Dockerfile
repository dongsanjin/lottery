FROM node:lts-alpine

RUN mkdir -p /app
WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . .
RUN npm run build
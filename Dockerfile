FROM node:lts-alpine as builder

RUN mkdir -p /app \
    mkdir -p /dist
WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY . .
RUN npm run build 

COPY ./build /dist

FROM nginx:stable-alpine

EXPOSE 80

RUN mkdir -p /etc/nginx/ssl

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /dist /usr/share/nginx/html
FROM node:16-alpine AS build

WORKDIR /home/node/app

COPY . .

RUN npm install
RUN npm run build

FROM httpd:alpine3.16 AS prod

WORKDIR /usr/local/apache2/htdocs/
COPY --from=build /home/ubaid/app/dist .

RUN adduser node2

RUN su - node2

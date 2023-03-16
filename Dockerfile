FROM node:16

WORKDIR /usr/src/app
ADD . .

RUN npm install && npm run build
CMD node build
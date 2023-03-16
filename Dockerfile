FROM node:16

WORKDIR /usr/src/app
ADD . .

RUN npm install && npm run build
EXPOSE 3000
CMD node build
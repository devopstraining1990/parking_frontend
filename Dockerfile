FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm install --only=production
RUN npm audit fix
RUN npm run build

COPY src /public/src

EXPOSE 3000

CMD [ "npm", "start" ]

# FROM node:latest

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 3000
# CMD [ "node", "index.js" ]
FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
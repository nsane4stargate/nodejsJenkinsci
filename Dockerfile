# Base image
FROM ubuntu

# Work directory on container
WORKDIR /app

RUN apt update
RUN apt-get install -y curl
COPY package.* .
RUN curl -fsSL https://deb.nodesource.com/setup_16.x
RUN apt-get install -y nodejs
COPY . .
RUN apt-get install -y npm
RUN npm install express
RUN node --version
RUN npm --version

CMD [ "npm", "start" ]

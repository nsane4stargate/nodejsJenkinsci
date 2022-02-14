FROM jenkins/jenkins:lts
USER root

WORKDIR /docker/install

RUN apt-get update
RUN apt-get install curl
RUN curl -sSLO https://raw.githubusercontent.com/docker/docker-install/master/install.sh 
RUN chmod +x ./install.sh 
RUN ./install.sh 
RUN usermod -aG docker jenkins
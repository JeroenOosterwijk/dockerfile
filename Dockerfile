FROM ubuntu:16.04


RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get install curl -y
RUN sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install nodejs -y
RUN cd /
RUN sudo mkdir ingest
RUN cd /ingest
COPY . .
# RUN apt-get install -y git
# RUN sudo git clone https://github.com/TTNEnschede/ttne-data-platform-ingest.git
# RUN cd /ingest
RUN cd /ttne-data-platform-ingest-master
RUN ls

RUN export INGEST_DB_URI=mongodb://10.0.5.50:27017/ttne_data
RUN sudo npm install -y
RUN sudo npm start
RUN cd /
RUN sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
RUN sudo apt-get update -y
RUN sudo apt-get install mosquitto -y
RUN sudo apt-get install mosquitto-clients -y

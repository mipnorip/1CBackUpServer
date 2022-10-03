FROM ubuntu:18.04

RUN apt update \
    && apt upgrade -y\
    && apt install x11-utils gnumeric \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt update \
    && apt install python3.10 -y

ENV LOGIN=login
ENV PASSWORD=password

RUN mkdir /backup
COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt
RUN python3 main.py
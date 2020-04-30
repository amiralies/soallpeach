FROM archlinux:latest

RUN pacman --noconfirm -Sy gcc
COPY . /app
WORKDIR /app

RUN g++ main.cpp -o main

ENTRYPOINT ["main"]


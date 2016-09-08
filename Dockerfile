
FROM docker/whalesay:latest

# Metadata indicating an image maintainer.
MAINTAINER roberto.calandra@berkeley.edu

RUN apt-get -y update && apt-get install -y fortunes

# COPY -> to copy files/data

# Comment
CMD /usr/games/fortune -a | cowsay
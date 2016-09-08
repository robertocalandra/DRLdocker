# Start from the lastest version of Tensorflow with GPU support
FROM gcr.io/tensorflow/tensorflow:latest-gpu

# Image maintainer:
MAINTAINER roberto.calandra@berkeley.edu

#RUN apt-get -y update && apt-get install -y fortunes

# COPY -> to copy files/data

# Comment
# CMD /usr/games/fortune -a | cowsay


# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh"]
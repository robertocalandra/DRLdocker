# Start from the lastest version of Tensorflow with GPU support
FROM gcr.io/tensorflow/tensorflow:latest-gpu

# Image maintainer:
MAINTAINER roberto.calandra@berkeley.edu

# ----- Install GPS (http://rll.berkeley.edu/gps/) -----
RUN apt-get update && apt-get install -y \
	git \
	libprotobuf-dev \
	libboost-all-dev
	# libprotobuf-compiler # NOT FOUND, Necessary?
RUN pip install protobuf
RUN git clone https://github.com/cbfinn/gps.git
# WORKDIR "/gps/"
RUN chmod +x gps/compile_proto.sh

# COPY -> to copy files/data

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"

# Test GPS
CMD echo "Starting GPS" 
CMD ["python python/gps/gps_main.py"]

# Start Jupyter Notebook
CMD ["/run_jupyter.sh"]

# Start from the lastest version of Tensorflow with GPU support
FROM gcr.io/tensorflow/tensorflow:latest-gpu
# FROM nvidia/cuda:8.0-cudnn5-devel # -> perhaps necessary to have ubuntu 16?

# Image maintainer:
MAINTAINER roberto.calandra@berkeley.edu


ENV MUJOCO 140

####################################################################
# Install TensorFlow
####################################################################


####################################################################
# Anaconda (https://hub.docker.com/r/drunkar/anaconda-tensorflow-gpu/~/dockerfile/)
####################################################################



####################################################################
# Install GPS (http://rll.berkeley.edu/gps/) 
####################################################################

RUN apt-get update && apt-get install -y \
		git \
		libprotobuf-dev \
		libboost-all-dev 
		# libprotobuf-compiler # NOT FOUND, Necessary?

	RUN pip install protobuf
	RUN git clone https://github.com/cbfinn/gps.git
	# WORKDIR "/gps/"
	RUN chmod +x gps/compile_proto.sh
	# WORKDIR /gps
	# RUN ./compile_proto.sh
	
	# Clean up
	# rm 


####################################################################
# MuJoCo
####################################################################

RUN apt-get update && apt-get install -y \
		openscenegraph \
		libopenscenegraph-dev \
		wget
RUN wget https://www.roboti.us/download/mjpro$MUJOCO_linux.zip
RUN rm mjpro$MUJOCO_linux.zip
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/gps/build/lib
# export PYTHONPATH=$PYTHONPATH:/path/to/gps/build/lib
# source ~/.bashrc

####################################################################
# ROS (Requires Ubuntu >15) (http://wiki.ros.org/kinetic/Installation/Ubuntu)
####################################################################

# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
# 	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116 && \
# 	apt-get update && apt-get install -y \
# 		ros-kinetic-desktop-full \
# 		python-rosinstall
	

####################################################################
# Project Malmo
####################################################################



####################################################################

# Clean
RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/*

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

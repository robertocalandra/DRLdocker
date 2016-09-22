# Start from the lastest version of Tensorflow with GPU support
FROM tensorflow/tensorflow:nightly-gpu
# FROM nvidia/cuda:8.0-cudnn5-devel # -> perhaps necessary to have ubuntu 16?

# Image maintainer:
MAINTAINER roberto.calandra@berkeley.edu

# Version of dependencies
ENV UBUNTU="14.04" \\
	MUJOCO="140" \\
	MALMO="0.15.0" \\
	ROS="Indigo"

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
		unzip \
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
		unzip \
		openscenegraph \
		libopenscenegraph-dev \
		wget
		
RUN wget https://www.roboti.us/download/mjpro140_linux.zip
RUN unzip mjpro140_linux.zip
RUN rm mjpro140_linux.zip
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/gps/build/lib
# export PYTHONPATH=$PYTHONPATH:/path/to/gps/build/lib
# source ~/.bashrc


####################################################################
# ROS (http://wiki.ros.org/kinetic/Installation/Ubuntu)
####################################################################

# NOTE: Kinetic requires Ubuntu >15)

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
 	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116 && \
 	apt-get update && apt-get install -y \
 		ros-indigo-desktop-full \
 		python-rosinstall
	

####################################################################
# Project Malmo
####################################################################

RUN apt-get update && apt-get install -y \
		unzip \
		wget
		
RUN wget https://github.com/Microsoft/malmo/releases/download/0.15.0/Malmo-0.15.0-Linux-Ubuntu-14.04-64bit.zip
RUN unzip Malmo-0.15.0-Linux-Ubuntu-14.04-64bit.zip
#cd Malmo-0.15.0-Linux-Ubuntu-14.04-64bit/Minecraft
#./launchClient.sh
RUN rm Malmo-0.15.0-Linux-Ubuntu-14.04-64bit.zip


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

# Start Jupyter Notebook for interactive mode
CMD ["/run_jupyter.sh"]

# Start from the lastest version of Tensorflow with GPU support
FROM tensorflow/tensorflow:nightly-gpu
# FROM nvidia/cuda:8.0-cudnn5-devel # -> perhaps necessary to have ubuntu 16?

# Image maintainer:
MAINTAINER roberto.calandra@berkeley.edu

# Version of dependencies
ENV UBUNTU="14.04" \\
	MUJOCO="131" \\
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
# OpenAI Gym
####################################################################

RUN apt-get update && apt-get install -y \
		python-numpy \
		python-dev \
		cmake \
		zlib1g-dev \
		libjpeg-dev \
		xvfb \
		libav-tools \
		xorg-dev \
		python-opengl \
		libboost-all-dev \
		libsdl2-dev \
		swig \
		git
		
	RUN git clone https://github.com/openai/gym.git
	RUN cd gym
	RUN pip install -e '.[all]'

####################################################################
# MuJoCo
####################################################################

RUN apt-get update && apt-get install -y \
		unzip \
		openscenegraph \
		libopenscenegraph-dev \
		wget \ 
		xvfb
		
	RUN wget https://www.roboti.us/download/mjpro131_linux.zip
	RUN unzip mjpro131_linux.zip

# RUN pip install mujoco-py # This is for compatibility with OpenAIGym
# If you want to install for GPS run this
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/gps/build/lib
# export PYTHONPATH=$PYTHONPATH:/path/to/gps/build/lib
# source ~/.bashrc
	RUN rm mjpro131_linux.zip


####################################################################
# ROS (http://wiki.ros.org/kinetic/Installation/Ubuntu)
####################################################################

# NOTE: Kinetic requires Ubuntu >15

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
 	apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116 && \
 	apt-get update && apt-get install -y \
 		ros-indigo-desktop-full \
 		python-rosinstall

RUN sudo rosdep init \
	&& rosdep update
#RUN rosdep update
#RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
#RUN source ~/.bashrc

####################################################################
# Gazebo
####################################################################

RUN sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

RUN apt-get update && apt-get install -y \
		gazebo7 \
		libgazebo7-dev

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

# Default directory that will be saved by htcondor
3RUN mkdir /tmp/results
#RUN nvidia-smi -f /tmp/temp.txt

# COPY -> to copy files/data from to localmachine

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR "/notebooks"

# Test GPS
#CMD echo "Starting GPS" 
#CMD ["python python/gps/gps_main.py"]

# Start Jupyter Notebook for interactive mode
#CMD ["/run_jupyter.sh"]

FROM ros:melodic-ros-base

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ros-melodic-cv-bridge \
    python-pip python-matplotlib \
  && rm -rf /var/lib/apt/lists/*
COPY . /kitti2bag

RUN apt-get -y install ros-melodic-cv-bridge
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
	ros-melodic-tf*\
	ros-melodic-tf2*

RUN pip install kitti2bag
RUN pip install pykitti
RUN pip install numpy

WORKDIR /data

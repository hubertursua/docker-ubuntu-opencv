FROM ubuntu:16.04
MAINTAINER Hyubs Ursua

# CREDIT: https://github.com/milq/scripts-ubuntu-debian/blob/master/install-opencv.sh

# KEEP UBUNTU OR DEBIAN UP TO DATE

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
RUN apt-get install -y build-essential cmake

# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
RUN apt-get install -y qt5-default libvtk6-dev

# Media I/O:
RUN apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
RUN apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
RUN apt-get install -y libtbb-dev libeigen3-dev

# Python:
RUN apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
RUN apt-get install -y ant default-jdk

# Documentation:
RUN apt-get install -y doxygen

# Run OpenCV build script
ADD build_opencv.sh /build_opencv.sh
RUN /bin/sh /build_opencv.sh
RUN rm -rf /build_opencv.sh
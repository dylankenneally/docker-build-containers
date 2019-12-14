# Container for building C++ apps
# Tool set on CentOS v8: GNU CC v8.2, CMake v3.16

FROM centos:8

LABEL maintainer="Dylan Kenneally"
LABEL version="1.0"
LABEL description="CentOS C++ Build Tooles. Container for building C++ apps. Based on CentOS v8 with GCC v8.2, CMake v3.16"

RUN yum -y update

# gcc (GCC) 8.2.1 20180905 (Red Hat 8.2.1-3)
RUN dnf -y install gcc
RUN dnf -y groupinstall "Development Tools"
RUN gcc --version

# install wget, we use it to get CMake
RUN dnf -y install wget

# download and install CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.1/cmake-3.16.1-Linux-x86_64.sh \
	-q -O /tmp/cmake-install.sh \
	&& chmod u+x /tmp/cmake-install.sh \
	&& mkdir /usr/bin/cmake \
	&& /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
	&& rm /tmp/cmake-install.sh
ENV PATH="/usr/bin/cmake/bin:${PATH}"
RUN cmake --version


FROM ubuntu:latest

ENV SINGULARITY_VERSION=2.6.1
ENV BUILD_SOFTWARE="libtool automake gcc build-essential"
ENV CONTAINER_SOFTWARE="git squashfs-tools libarchive-dev python python-dev python3-pip"
ENV SREGISTRY_CLIENT=registry
ENV CLONE_TMP="clone_dir/"
ENV PIP_INSTALL="requests_toolbelt gitpython iso8601 sregistry"


RUN apt-get update && \
    apt-get install ${BUILD_SOFTWARE} ${CONTAINER_SOFTWARE} -y && \
    git clone https://github.com/singularityware/singularity.git ${CLONE_TMP}&& \
    cd ${CLONE_TMP} && \
    git checkout ${SINGULARITY_VERSION} && \ 
    bash autogen.sh && \
    bash configure --prefix=/usr/local && \
    make install && \
    cd .. && rm -rf ${CLONE_TMP} && \
    pip3 install ${PIP_INSTALL} && \
    apt-get purge ${BUILD_SOFTWARE} -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* 

ADD ./sregistry_file /sregistry_file

CMD ["/bin/bash"]

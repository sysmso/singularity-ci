FROM fedora:42
LABEL maintainer="Martin souchal <martin.souchal@inrae.fr>"
LABEL org.opencontainers.image.description="apptainer in docker for building and pushing singularity / apptainer containers and upload them to a singularity registry."

RUN dnf install -y apptainer python3-pip && dnf clean all
RUN pip install sregistry

ADD ./sregistry_file /sregistry_file

CMD ["/bin/bash"]

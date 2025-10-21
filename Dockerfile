FROM fedora:42
LABEL maintainer="Martin souchal <martin.souchal@inrae.fr>"
LABEL org.opencontainers.image.description "CI docker container for building and pushing singularity and apptainer containers to a registry."

RUN dnf install -y apptainer && dnf clean all

ADD ./sregistry_file /sregistry_file

CMD ["/bin/bash"]

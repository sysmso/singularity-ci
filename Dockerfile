FROM fedora:42
LABEL maintainer="Martin souchal <martin.souchal@inrae.fr>"

RUN dnf install -y apptainer && dnf clean all

ADD ./sregistry_file /sregistry_file

CMD ["/bin/bash"]

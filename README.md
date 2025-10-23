# singularity-ci

The Dockerfile in this repository builds Apptainer. The resulting Docker image can be used on any system with Docker to build Apptainer images. 

CI docker container for building and pushing singularity containers to a registry.

## How to upload container to sregistry with Gitlab CI
 
Example of `.gitlab-ci.yml` to build and push a container named `container.simg`, based on a `Singularity` recipe file into a sregistry :
```
image: sysmso/singularity-ci:apptainer

stages:
  - build
  - deploy

singularity-image:
  stage: build
  script: 
     - singularity build container.simg Singularity
  artifacts:
    paths:
     - container.simg

deploy:
  stage: deploy
  script:
   - source /sregistry_file
   - echo $SREGISTRY_FILE > ~/.sregistry
   - sregistry push container.simg --name apc/tp-singu:latest --tag tuto
```
You have to register 3 variables in Gitlab CI in order to use this method :

`SREGISTRY_HOSTNAME` : URL of the repository

`SREGISTRY_TOKEN` : Token 

`SREGISTRY_USERNAME` : username in the registry


### Don't forget to protect these variables !!

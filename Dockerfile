#Get the base docker image file
#FROM divyabhushan/learn_docker:ubuntu_yum_1.0
FROM ubuntu:latest

#Install vim and git utilities
RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y git

#Set the SHELL variable
RUN SHELL=/bin/bash

RUN mkdir -p /home/docker_images
WORKDIR /home/docker_images

#Copy the entire code from local machine into the container
COPY . .

#ENTRYPOINT ["./myApp.sh"]

CMD ["/bin/bash"]


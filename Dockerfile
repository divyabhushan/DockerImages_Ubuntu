#Get the base docker image file
FROM ubuntu:14.04

#Install vim and git utilities
RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y git \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/apt \
    && rm -rf /var/lib/dpkg \
    && rm -rf /var/lib/cache \
    && rm -rf /var/lib/log 

#Set the SHELL variable
RUN SHELL=/bin/bash

RUN mkdir -p /home/docker_images
WORKDIR /home/docker_images

#Copy the entire code from local machine into the container
COPY . .

#ENTRYPOINT ["./myApp.sh"]

CMD ["/bin/bash"]


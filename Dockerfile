#Get the base docker image file
FROM divyabhushan/learn_docker:ubuntu_yum_1.0

#Install vim
#RUN apt-get install -y vim

#Install git
#RUN apt-get -y install git

#Set the SHELL variable
RUN SHELL=/bin/bash

RUN mkdir -p /home/docker_images
WORKDIR /home/docker_images

#Copy the entire code from local machine into the container
COPY . .

#ENTRYPOINT ["./myApp.sh"]

CMD ["/bin/bash"]


#Get the base docker image file
FROM divyabhushan/learn_docker:ubuntu_yum_1.0

#Install vim utility
RUN apt-get -y install vim

#Set the SHELL variable
RUN SHELL=/bin/bash


CMD ["/bin/bash"]


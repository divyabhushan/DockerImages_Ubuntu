Project name: DockerImages_Ubuntu
author: Divya
version: 1.1

Description: This git repository keeps a track of ubuntu docker images.
There is a base ubuntu image and other tagged images are built on top of this base layer with few modifications in each one of them.

Developed myApp.sh application
loaded its run-time test environment.
Added the applications supporting binaries, configuration files, codes, library.

Added DockerFile with instruction to choose a base image as production environment.

Deploy and run the entire test package in the production environmnet.

Add docker-compose.test.yml file to run automated build tests.
Include a file run_tests.sh with post tests in prod environment.

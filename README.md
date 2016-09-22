# NodeContainer
A Dockerfile for my own setup of NodeJS on an Ubuntu base.

## Motivation
NodeJS and various packages are poorly supported on Windows at the time of writing - in particular angular-cli, which makes playing around with Angular2 much easier.

## Typical Usage
    $ docker build . -t "lewisgj/nodecontainer"
    $ docker run -v /some/local/directory:/home/developer/projects -it lewisgj/nodecontainer 

# NodeDE
A Dockerfile for my own setup of NodeJS on an Ubuntu base.

## Motivation
NodeJS is a little bit of a pain on Windows, and I wanted a dev environment that was consistent across multiple machines. 

## Typical Usage
    $ docker pull lewisgj/nodede

or inside a fresh copy of this repo:

    $ docker build . -t "lewisgj/NodeDE"

Then run:

    $ docker run -v /some/local/dir:/home/developer/projects -it lewisgj/NodeDE 

to mount /some/local/dir inside the default user's home directory with everything set up.

# Troubleshooting On Windows (10)

Getting this to work on Windows as I'd like is a pain as Powershell and CMD always use Windows line endings, but Bash running inside the container won't accept them. 

As a workaround, it's possible to use the Windows Subsystem for Linux on Windows 10. 

## Instructions

1. Install Docker For Windows (*not Docker Toolbox*)
1. Install Windows Subsystem For Linux (*a.k.a BASH for Windows 10)
1. Restart, Run bash, then `apt-get install docker.io`
1. Modify ~/.bashrc, adding: `export DOCKER_HOST=127.0.0.1:2375`
1. `source ~/.bashrc`
1. Then just use your Bash session to do anything docker-related.

I assume this works because the Windows Subsystem sends different line-endings to Bash.  


FROM ubuntu:latest
MAINTAINER Lewis Greenway-Jones <lewis@lg-j.com>

# Install basic packages - will also install recommended packages

RUN apt-get update
RUN apt-get update && apt-get install -y -q \
        curl \
        git \
        python \
        wget \
        vim  \
        dos2unix \
&& rm -rf /var/lib/apt/lists/*

# Use non-root user
RUN useradd -ms /bin/bash developer 
USER developer
ENV BASH_ENV "~/.bashrc"

# Install Node
ENV NVM_DIR "/home/developer/.nvm"
ENV NODE_VERSION v6.6.0
RUN bash -c "curl https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | bash"
RUN mkdir -p $NVM_DIR/versions
RUN bash -l -c "source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default"

# Install NPM packages
RUN bash -l -c "source $NVM_DIR/nvm.sh && npm install -g angular-cli create-react-app"

ENTRYPOINT ["bash", "--login"]



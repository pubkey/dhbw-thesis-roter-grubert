#!/usr/bin/env bash
FROM ubuntu:latest

RUN echo "Version: 1.0"

RUN apt-get -y update && apt-get -y upgrade

##helpers (not essential)
RUN apt-get install -y nano
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y htop
RUN apt-get install -y lsof


## nodejs v 4.3##
RUN cd /usr/local
RUN wget https://nodejs.org/dist/v4.3.0/node-v4.3.0-linux-x64.tar.gz -O nodejs.tar.gz
RUN tar -C /usr/local --strip-components 1 -xzf nodejs.tar.gz
RUN rm -r nodejs.tar.gz
## symlinks
RUN ls -l /usr/local/bin/node
RUN ls -l /usr/local/bin/npm
RUN ln -s `which node` /usr/bin/nodejs



## things to build npm-modules
RUN apt-get install build-essential -y
RUN apt-get install python -y
RUN apt-get install g++ -y

## npm modules
RUN sudo npm install node-gyp -g
#grunt
RUN npm i -g grunt
RUN npm install -g grunt-cli


#latex
RUN apt-get -y update && apt-get -y upgrade && apt-get install latexmk -y
RUN apt-get install texlive texlive-lang-german texlive-doc-de texlive-latex-extra -y
RUN apt-get install texlive-bibtex-extra -y


#ATOM.io
#@link https://hub.docker.com/r/jamesnetherton/docker-atom-editor/~/dockerfile/
ENV ATOM_VERSION v1.6.1
RUN apt-get update && \
    apt-get install git \
                    curl \
                    ca-certificates \
                    libgtk2.0-0 \
                    libxtst6 \
                    libnss3 \
                    libgconf-2-4 \
                    libasound2 \
                    fakeroot \
                    gconf2 \
                    gconf-service \
                    libcap2 \
                    libnotify4 \
                    libxtst6 \
                    libnss3 \
                    gvfs-bin \
                    xdg-utils -y --no-install-recommends && \
    apt-get clean
RUN curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb > /tmp/atom.deb
RUN dpkg -i /tmp/atom.deb
RUN rm -f /tmp/atom.deb





COPY entrypoint.bash /usr/bin/entrypoint.bash
ENTRYPOINT /bin/bash /usr/bin/entrypoint.bash

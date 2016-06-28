#!/usr/bin/env bash
FROM ubuntu:14.04

RUN echo "Version: 1.0"

RUN apt-get -y update && apt-get -y upgrade


##helpers (not essential)
RUN apt-get install -y nano
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y htop
RUN apt-get install -y lsof


#latex
RUN apt-get -y update && apt-get -y upgrade && apt-get install latexmk -y
RUN apt-get install texlive texlive-lang-german texlive-doc-de texlive-latex-extra -y
RUN apt-get install texlive-bibtex-extra -y


RUN apt-get install openjdk-7-jdk -y


COPY entrypoint.bash /usr/bin/entrypoint.bash
ENTRYPOINT /bin/bash /usr/bin/entrypoint.bash

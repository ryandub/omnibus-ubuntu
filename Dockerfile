FROM ubuntu:lucid
MAINTAINER ryan.walker@rackspace.com 

RUN apt-get update && apt-get install -y python-software-properties && \
    add-apt-repository ppa:git-core/ppa && \
    add-apt-repository ppa:brightbox/ruby-ng

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    ruby1.9.3 \
    rubygems \
    ruby-switch \
    libssl-dev \
    libreadline-dev \
    libxslt1-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libexpat1-dev \
    libicu-dev

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN gem install bundler --no-ri --no-rdoc

RUN git config --global url."https://".insteadOf git://
RUN git config --global user.email ryan.walker@rackspace.com
RUN git config --global user.name "Ryan Walker"

RUN git clone https://github.com/ryandub/omnibus-ohai-solo.git && \
    cd omnibus-ohai-solo && \
    bundle install --binstubs

WORKDIR /omnibus-ohai-solo

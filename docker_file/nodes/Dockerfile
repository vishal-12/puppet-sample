FROM ubuntu:trusty

MAINTAINER Sreeprakash Neelakantan <sree@schogini.com>

ENV PUPPET_AGENT_VERSION="5.1.0" UBUNTU_CODENAME="xenial" DUMB_INIT_VERSION="1.2.0" PUPPETSERVER_JAVA_ARGS="-Xms256m -Xmx256m" PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH PUPPET_HEALTHCHECK_ENVIRONMENT="production"

RUN apt-get update && \
    apt-get install --no-install-recommends -y tree nano wget ca-certificates lsb-release && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb && \
    dpkg -i puppetlabs-release-pc1-trusty.deb && \
    apt-get update && \
    apt-get install --no-install-recommends -y puppet-agent

COPY ./code /etc/puppetlabs/code
COPY Dockerfile /

#docker build -t schogini/puppetnode-ubuntu .
#docker network create puppet
#docker run -ti --rm --net puppet --name puppetnode1 --hostname puppetnode1  schogini/puppetnode-ubuntu

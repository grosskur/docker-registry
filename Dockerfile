FROM ubuntu:14.04
MAINTAINER Alan Grosskurth <code@alan.grosskurth.ca>

RUN \
  locale-gen en_US.UTF-8 && \
  apt-get update && \
  env DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    build-essential \
    libevent1-dev \
    liblzma-dev \
    python-dev \
    python-virtualenv

ADD requirements.txt /app/requirements.txt
ADD config.yml /app/config.yml
ADD .boto /app/.boto

WORKDIR /app

RUN \
  virtualenv .venv && \
  .venv/bin/pip install -r requirements.txt

ENV DOCKER_REGISTRY_CONFIG /app/config.yml
ENV HOME /app
ENV PATH /app/.venv/bin:$PATH
ENV SETTINGS_FLAVOR s3
ENV VIRTUAL_ENV /app/.venv

EXPOSE 5000
USER nobody

ENTRYPOINT ["docker-registry"]
CMD []

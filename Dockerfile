FROM docker:latest
#python
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
#other apps
RUN apk update && apk add --no-cache --virtual .build-deps \
  libstdc++ \
  binutils-gold \
  curl \
  g++ \
  gcc \
  gnupg \
  libgcc \
  nodejs \
  nodejs-npm \
  linux-headers \
  make \
  git \
  openssh \
  bash
RUN npm install balena-cli -g --production --unsafe-perm

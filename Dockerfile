FROM node:8.11.2
MAINTAINER Nora Szepes <me@szepesnora.com>

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update \
  && apt-get install -y google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*

ARG ember_version=3.4.2

# Install ember
RUN yarn global add ember-cli@$ember_version

FROM node:alpine

RUN apk update && apk upgrade && \
  apk add --no-cache openssl ca-certificates

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

RUN wget https://github.com/Droplr/aws-env/raw/master/bin/aws-env-linux-amd64 -O /bin/aws-env && \
  chmod +x /bin/aws-env

COPY config.tmp .
COPY readFile.js .
CMD eval $(aws-env) && envsubst  < config.tmp > config && node readFile.js

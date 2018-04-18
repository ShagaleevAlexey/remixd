FROM node:9.11.1

RUN apt-get update \
    && apt-get install nano

USER node

RUN mkdir /home/node/.npm-global ; \
    mkdir -p /home/node/app ; \
    chown -R node:node /home/node/app ; \
    chown -R node:node /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

WORKDIR /home/node/app

RUN npm install -g remixd

RUN mkdir soldata

CMD [ "remixd", "-s", "soldata" ]
# CMD [ "/bin/bash" ]
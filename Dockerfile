ARG BASE_IMG=node:alpine
FROM $BASE_IMG

LABEL version="0.1"
LABEL description="Containerization of Introduction to DSH"

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN npm install -g reveal-md

COPY . /home/node/slides/
WORKDIR /home/node/slides

# RUN npm install -g

# ENTRYPOINT ["/home/node/.npm-global/bin/reveal-md"]

ARG REVEAL_PORT="1948"
EXPOSE $REVEAL_PORT

CMD ["/home/node/.npm-global/bin/reveal-md","intro.md","-w"]
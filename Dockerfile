FROM node:26-bookworm-slim

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    make \
    g++ \
    git \
    ca-certificates \
    tini && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n@2.40.5

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

USER node

WORKDIR /home/node

EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]

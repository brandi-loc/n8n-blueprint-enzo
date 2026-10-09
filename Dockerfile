FROM n8nio/n8n:2.40.5

USER root

COPY --from=alpine:3.24 /sbin/apk /sbin/apk
COPY --from=alpine:3.24 /lib/apk /lib/apk
COPY --from=alpine:3.24 /usr/lib/libapk* /usr/lib/

RUN apk add --no-cache python3

USER node

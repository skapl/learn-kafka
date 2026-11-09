FROM apache/kafka:latest
USER root
RUN apk add --no-cache iproute2

USER appuser

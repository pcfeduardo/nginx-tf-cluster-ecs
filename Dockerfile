FROM alpine:3.15.0

# Updating alpine
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
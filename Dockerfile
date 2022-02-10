FROM alpine:3.15.0

WORKDIR /www

# Updating alpine
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Installing NGINX and backuping config files
RUN apk --no-cache add nginx && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

ADD cfg/nginx.conf /etc/nginx/nginx.conf
ADD src/index.html .

# Exposing port 80
EXPOSE 80

# Entrypoint and params
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
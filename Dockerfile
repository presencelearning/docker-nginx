FROM ablerman/base:latest
MAINTAINER Francois Gaudin <francois@presencelearning.com>

ENV NGINX_VERSION 1.7.10-1~trusty

RUN \
  apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 && \
  apt-get -y install software-properties-common && \
  add-apt-repository -y "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" && \
  apt-get update && \
  apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
  rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY logstash-forwarder.conf /etc/logstash-forwarder/
COPY supervisord.conf /etc/supervisor/conf.d/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

EXPOSE 80 443
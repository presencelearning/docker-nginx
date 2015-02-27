FROM ablerman/base:latest
MAINTAINER Francois Gaudin <francois@presencelearning.com>

# Install Nginx.
RUN \
  apt-get -y install software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

COPY logstash-forwarder.conf /etc/logstash-forwarder/
COPY supervisord.conf /etc/supervisor/conf.d/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Expose ports.
EXPOSE 80
EXPOSE 443
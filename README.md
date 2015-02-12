# nginx
Nginx container using logstash-forwarder

### Base Docker Image

* [dockerfile/nginx](http://dockerfile.github.io/#/nginx)

## usage 
    docker run -p 8080:80 -d --link logstash:logstash --volumes-from logstash fgaudin/nginx

If logstash is on another host, you can provide the logstash address and the certificates like this:

    docker run -p 8080:80 -d -e LOGSTASH_PORT_5043_TCP_ADDR=172.17.42.1 -e LOGSTASH_PORT_5043_TCP_PORT=15043 -v /path/to/certificates_dir:/mnt/logstash-forwarder fgaudin/nginx

## see also

* [fgaudin/logstash](https://registry.hub.docker.com/u/fgaudin/logstash/)

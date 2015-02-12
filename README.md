# nginx
Nginx container using logstash-forwarder

### Base Docker Image

* [dockerfile/nginx](http://dockerfile.github.io/#/nginx)

## usage 
    sudo docker run -p 8080:80 -d --link logstash:logstash --volumes-from logstash fgaudin/nginx

This assumes that your logstash container is running on the same host.
Link is used to provide the domain name/IP of the logstash container while volumes-from is used to provide the certificates


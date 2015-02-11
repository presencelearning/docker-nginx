# docker-nginx
Nginx container using logstash-forwarder

## usage example
    sudo docker run -p 8080:80 --name nginx -d --link logstash:logstash --volumes-from logstash fgaudin/nginx


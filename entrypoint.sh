#!/bin/bash

config=$(</etc/logstash-forwarder/logstash-forwarder.conf);
PORT=${LOGSTASH_PORT_5043_TCP_PORT:?"5043"}
if [ -n "$LOGSTASH_PORT_5043_TCP_ADDR" ]; then
  echo "replacing logstash address by $LOGSTASH_PORT_5043_TCP_ADDR:$PORT"
  config=${config//logstash:5043/$LOGSTASH_PORT_5043_TCP_ADDR:$PORT};
fi
printf '%s\n' "$config" >/etc/logstash-forwarder/logstash-forwarder.conf

exec "$@"

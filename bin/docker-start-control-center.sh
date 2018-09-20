#!/bin/bash 
BOOTSTRAP_SERVERS=""
for (( i=$1 ; $i ; i=(($i - 1)) )) ; do BOOTSTRAP_SERVERS="kafka-$i:9092,$BOOTSTRAP_SERVERS" ; done
echo "using brokers: $BOOTSTRAP_SERVERS"

docker run -d \
  --net=$NETWORK_NAME \
  --name=schema-registry \
  -e SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL=zookeeper:2181 \
  -e SCHEMA_REGISTRY_HOST_NAME=schema-registry \
  -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8081 \
  confluentinc/cp-schema-registry

docker run -d \
  --net=$NETWORK_NAME \
  --name=kafka-rest \
  -e KAFKA_REST_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e KAFKA_REST_LISTENERS=http://0.0.0.0:8082 \
  -e KAFKA_REST_SCHEMA_REGISTRY_URL=http://schema-registry:8081 \
  -e KAFKA_REST_HOST_NAME=kafka-rest \
  confluentinc/cp-kafka-rest

docker run -d  \
  --name=control-center \
  --net=$NETWORK_NAME \
  --ulimit nofile=16384:16384 \
  -p 9021:9021 \
  -v /tmp/control-center/data:/var/lib/confluent-control-center \
  -e CONTROL_CENTER_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -e CONTROL_CENTER_BOOTSTRAP_SERVERS=$BOOTSTRAP_SERVERS \
  -e CONTROL_CENTER_REPLICATION_FACTOR=1 \
  -e CONTROL_CENTER_MONITORING_INTERCEPTOR_TOPIC_PARTITIONS=1 \
  -e CONTROL_CENTER_INTERNAL_TOPICS_PARTITIONS=1 \
  -e CONTROL_CENTER_STREAMS_NUM_STREAM_THREADS=2 \
  -e CONTROL_CENTER_CONNECT_CLUSTER=http://kafka-connect:8082 \
  confluentinc/cp-enterprise-control-center 

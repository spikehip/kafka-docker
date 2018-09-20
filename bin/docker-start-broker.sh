if [ -z $1 ]; then 
  echo "ERROR: define broker name"
  exit 1
fi

echo "starting broker $1"
docker run -d --net=$NETWORK_NAME --name=$1 -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://$1:9092 -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 confluentinc/cp-kafka




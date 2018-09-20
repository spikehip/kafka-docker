echo "starting zookeeper"

docker run -d --net=$NETWORK_NAME --name zookeeper -e ZOOKEEPER_CLIENT_PORT=2181 confluentinc/cp-zookeeper



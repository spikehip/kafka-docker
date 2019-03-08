export NETWORK_NAME="confluent"
MAX_BROKERS=3
#---------------------------------------------------------------------------------------------
SCRIPT_DIR=$(pwd)

alias kafka-zookeeper-start='$SCRIPT_DIR/bin/docker-check-network.sh && $SCRIPT_DIR/bin/docker-check-process.sh zookeeper start || $SCRIPT_DIR/bin/docker-start-zookeeper.sh'
alias kafka-zookeeper-stop='$SCRIPT_DIR/bin/docker-check-network.sh && $SCRIPT_DIR/bin/docker-check-process.sh zookeeper stop'
alias kafka-zookeeper-restart='kafka-zookeeper-stop && kafka-zookeeper-start'

alias kafka-brokers-start='$SCRIPT_DIR/bin/docker-check-network.sh && for (( i=$MAX_BROKERS ; $i ; i=(($i - 1)) )) ; do $SCRIPT_DIR/bin/docker-check-process.sh kafka-$i start || $SCRIPT_DIR/bin/docker-start-broker.sh kafka-$i ; done'
alias kafka-brokers-stop='$SCRIPT_DIR/bin/docker-check-network.sh && for (( i=$MAX_BROKERS ; $i ; i=(($i - 1)) )) ; do $SCRIPT_DIR/bin/docker-check-process.sh kafka-$i stop ; done'
alias kafka-brokers-restart='kafka-brokers-stop && kafka-brokers-start'

alias kafka-control-center-start='$SCRIPT_DIR/bin/docker-check-network.sh && ( $SCRIPT_DIR/bin/docker-check-process.sh schema-registry start && $SCRIPT_DIR/bin/docker-check-process.sh kafka-rest start && $SCRIPT_DIR/bin/docker-check-process.sh kafka-connect start && $SCRIPT_DIR/bin/docker-check-process.sh control-center start ) || $SCRIPT_DIR/bin/docker-start-control-center.sh $MAX_BROKERS'

alias kafka-cli='docker run --net=$NETWORK_NAME --rm --name shell -ti confluentinc/cp-kafka /bin/bash'

alias kafka-purge-all='for CONTAINER_ID in $(docker ps | awk '\''/confluentinc.*Up/ { print $1 }'\'') ; do docker stop $CONTAINER_ID && docker rm $CONTAINER_ID ; done && for CONTAINER_ID in $(docker ps -a | awk '\''/confluentinc.*Exited/ { print $1 }'\''); do docker rm $CONTAINER_ID ; done'

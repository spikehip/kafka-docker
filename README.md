# Kafka in Docker

The repository creates a few helper aliases for bash to help managing a local single node Confluent Kafka cluster with docker. 

They are simply commands I'm tired to type. 

## Usage 

```
source kafka-helper.sh
```

### Start/stop/restart a zookeeper for Kafka 

```
kafka-zookeeper-start
kafka-zookeeper-stop
kafka-zookeeper-restart
```

### Start/stop/restart a number of brokers

The number of brokers is set in the kafka-helper.sh and stored under the environment variable MAX_BROKERS

The containers will be named sequentially kafka-1, kafka-2, kafka-3 and so on... 

```
kafka-brokers-start
kafka-brokers-stop
kafka-brokers-restart
```

Stop/restart one broker at a time with docker stop/start 
```
docker stop kafka-2
docker start kafka-2
```

### Start Control Center along with Schema Registry and Rest Proxy

Separate commands to stop/restart these components are not yet available. Use the docker commands to do so.

```
kafka-control-center-start
```

### Get a Bash shell with the Kafka CLI Tools 

```
kafka-cli 
```

### Purge the complete testing environment 

Stop and remove all kafka related containers. Just in case you're fed up with the whole mess. 
```
kafka-purge-all
```


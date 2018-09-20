# Kafka in Docker

The repository creates a few helper aliases for bash to help managing a local single node Confluent Kafka cluster with docker. 

They are simply commands I'm tired to type. 

## Usage 

```
source kafka-helper.sh
```

### Start/stop a zookeeper for Kafka 

```
kafka-zookeeper-start
kafka-zookeeper-stop
```

### Start/stop a number of brokers

The number of brokers is set in the kafka-helper.sh and stored under the environment variable MAX_BROKERS

```
kafka-brokers-start
kafka-brokers-stop
```

### Get a Bash shell with the Kafka CLI Tools 

```
kafka-cli 
```



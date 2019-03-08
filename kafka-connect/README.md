 - place driver jar files for kafka-connect in this directory
 - download the JdbcSourceConnector connector plugin from https://www.confluent.io/connector/kafka-connect-jdbc/#download
 - download the mysql jdbc driver

```
 curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.39.tar.gz" | tar -xzf - -C ./ --strip-components=1 mysql-connector-java-5.1.39/mysql-connector-java-5.1.39-bin.jar
```

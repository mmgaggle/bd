# Hadoop

## HDFS
Format Name Node

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/bin/hdfs namenode -format```

creates: /hadoop/hdfs/nn/current/VERSION

Start Name Node

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/sbin/hadoop-daemon.sh --config /hadoop/etc/hadoop start namenode```

Start Data Node

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/sbin/hadoop-daemon.sh --config /hadoop/etc/hadoop start datanode```

## YARN
Start Resource Manager

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/sbin/yarn-daemon.sh --config /hadoop/etc/hadoop start resourcemanager```

Start Node Manager

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/sbin/yarn-daemon.sh --config /hadoop/etc/hadoop start nodemanager```

## Map Reduce

Start Job History Server

```sudo JAVA_HOME=/usr/java/jdk1.8.0_131 /hadoop/sbin/mr-jobhistory-daemon.sh --config /hadoop/etc/hadoop start historyserver  ```

# Hive
* hive mysql install and config
* hive handlers
  * 

# Presto
* presto configs
* presto handlers

# Streaming
* zookeeper configs
* zookeeper handlers
* kafka configs
* secor install and config

# General
* collectd install and config

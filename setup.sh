#!/bin/bash

mirror='http://apache.mirrors.pair.com'

curl ${mirror}/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz -o hadoop-2.7.3.tar.gz
curl ${mirror}/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz -o apache-hive-2.1.1-bin.tar.gz
curl ${mirror}/spark/spark-2.1.1/spark-2.1.1-bin-hadoop2.7.tgz -o spark-2.1.1-bin-hadoop2.7.tgz
curl ${mirror}/kafka/0.10.2.1/kafka_2.10-0.10.2.1.tgz -o kafka_2.10-0.10.2.1.tgz

sudo mkdir /hadoop
sudo mkdir /hadoop/{hive,spark,kafka}

sudo tar xvzf /tmp/hadoop-2.7.3.tar.gz --skip 1 -C /hadoop
sudo tar xvzf /tmp/apache-hive-2.1.1-bin.tar.gz -C /hadoop/hive
sudo tar xvzf /tmp/spark-2.1.1-bin-hadoop2.7.tgz -C /hadoop/spark
sudo tar xvzf /tmp/kafka_2.10-0.10.2.1.tgz -C /hadoop/kafka

# Getting Started

Ansible Playbook to setup Big Data COE Stack.

First, install the Oracle Java playbook:

```sudo ansible-galaxy install ansiblebit.oracle-java```

# Groups

There are two main node groups that need to be defined in your ansible hosts
file:

* head
* worker

The "head" node runs cluster services

* yarn resource manager
* hdfs namenode
* zookeeper
* presto coordinator

The "worker" nodes do the heavy lifting

* yarn node manager
* hdfs datanode
* kafka broker
* kafka consumer (secor)
* presto worker

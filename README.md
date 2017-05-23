# About

This is an Ansible Playbook to setup all the components that are commonly used
by data driven organizations. The purpose of the playbook is to accelerate the
deployment of big data labs, enforcing consistency across labs, and to
otherwise simply the deployment of a very complex application stack.

# Dependencies

This playbook depends on the "oracle-java" playbook, you will need to install
it from Ansible Galaxy. You can do this by running this command, assuming you
already have Ansible installed.

```sudo ansible-galaxy install ansiblebit.oracle-java```

# Groups

There are two main host groups that need to be defined in your ansible hosts
file:

* head
* worker

The "head" host runs cluster services, and serve as a client bastion to launch
benchmarks from. You should only have one "head" host in your cluster.

* yarn resource manager
* yarn history server
* hdfs namenode
* zookeeper
* presto coordinator
* hive metastore

The "worker" hosts do the heavy lifting.

* yarn node manager
* hdfs datanode
* kafka broker
* kafka consumer (secor)
* presto worker

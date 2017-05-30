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

# AWS Infrasetup (optional)

sudo pip install --upgrade awscli
sudo pip install --upgrade boto

ansible-playbook -i hosts setup_aws_infra.yml

```
 _________________________________
< TASK [ec2 : Provision instance] >
 ---------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [localhost] => (item={u'type': u'head_node', u'group': u'head', u'name': u'head1'})
changed: [localhost] => (item={u'type': u'worker_node', u'group': u'workers', u'name': u'worker1'})
changed: [localhost] => (item={u'type': u'worker_node', u'group': u'workers', u'name': u'worker2'})
changed: [localhost] => (item={u'type': u'worker_node', u'group': u'workers', u'name': u'worker3'})
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

localhost                  : ok=10   changed=1    unreachable=0    failed=0

```

./ec2.py --list

Look for tag_Group_head and tag_Group_workers host groups

```
 "tag_Group_head": [
    "52.91.133.226"
  ],
  "tag_Group_workers": [
    "54.87.235.203",
    "54.236.45.167",
    "54.236.48.223"
  ],
```

Finally add these host entries in ansible inventory file i.e. ``hosts`` file. Your hosts file should look like this

```
[local]
localhost ansible_connection=local ansible_python_interpreter=/usr/local/bin/python

# There should be a single host in this host group
[head]
52.91.133.226

# All other compute hosts should be in this host group
[workers]
54.87.235.203
54.236.45.167
54.236.48.223
```

# Deploying Hadoop Stack

``ansible-playbook -i hosts site.yml``

```
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

52.91.133.226              : ok=31   changed=23   unreachable=0    failed=0
54.236.45.167              : ok=26   changed=18   unreachable=0    failed=0
54.236.48.223              : ok=26   changed=18   unreachable=0    failed=0
54.87.235.203              : ok=26   changed=18   unreachable=0    failed=0
localhost                  : ok=0    changed=0    unreachable=0    failed=1


real	4m47.226s
user	0m32.812s
sys	0m13.832s
```


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

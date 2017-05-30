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

# AWS Infra setup (optional)
- Install required packages
   - ``sudo pip install --upgrade awscli``
   - ``sudo pip install --upgrade boto``
- Add your **AWS Access Key** and **Secret key** in ``group_vars/aws_creds.yml``
- Edit AWS configuration parameters in ``group_vars/aws_vars.yml``. Some important variable to edit are :
   - ``my_ip`` : Add public ip address of your workstation
   - ``ec2_keypair`` : Add your EC2 keypair name
   - ``ec2_instance_details`` : If you want to provision multiple EC2 instances. Add as many lines (representing each instance). Don't forget to set correct TAGs. TAG ``group`` is the same as ansible inventory host group.
 
- Once you have updated required variables. Run ansible playbook to provision AWS resources
   - ``ansible-playbook -i hosts setup_aws_infra.yml``

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
- Once AWS resources are provisioned, list EC2 instances using dynamic inventory file
   - ``./ec2.py --list``
- Look for **tag_Group_head** and **tag_Group_workers** host groups
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
- Finally add these host entries (manually) in ansible inventory file i.e. ``hosts`` file. After addition your ``hosts file should look like this

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
# Ansible Groups for Hadoop Stack

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

# Hadoop Setup
- Add your **AWS Access Key** and **Secret key** in ``group_vars/all``

# Deploying Hadoop Stack
- To deploy Hadoop Stack , execute
  - ``ansible-playbook -i hosts site.yml``

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

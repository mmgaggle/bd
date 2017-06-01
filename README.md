# About

This is an Ansible Playbook to setup all the components that are commonly used
by data driven organizations. The purpose of the playbook is to accelerate the
deployment of big data labs, enforcing consistency across labs, and to
otherwise simply the deployment of a very complex application stack.

# Dependencies

This playbook depends on the "oracle-java" playbook, you will need to install
it from Ansible Galaxy. You can do this by running this command, assuming you
have Ansible installed.

```sudo ansible-galaxy install ansiblebit.oracle-java```

# Provision Data Lab on AWS EC2

The easiest way to experiment with this playbook and familiarize yourself with
the data lab it creates is to leverage Amazon EC2. Several python packages are
necessary for this approach, we recommend they be installed with pip:

```sudo pip install --upgrade awscli boto3```

In order to be able to access the data lab you will need to provide some
information in the form of variables. These variables are defined by editing
the ``group_vars/aws_vars.yml`` file, notably:

   - ``my_ip`` : Add public ip address of your workstation
   - ``ec2_keypair`` : Add your EC2 keypair name

You will also need to export your **AWS_ACCESS_KEY** and **AWS_SECRET_KEY** as
environment variables:

```
export AWS_ACCESS_KEY='Your_AWS_Access_Key_Here'
export AWS_SECRET_KEY='Your_AWS_Secret_Key_Here'
```

With the ansible and environmental variables set, you can instruct Ansible to
boot your data lab by executing the ``boot.yml`` play:

```ansible-playbook -i hosts boot.yml```

After the data lab is booted, verify ansible can reach all hosts:

```ansible -i ec2.py -u ec2-user -m ping all```

Once you have verified that all hosts are reachable, you can execute the site
play:

```ansible-playbook -i ec2.py site.yml```

# Provision Data Lab on Bare Metal

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

# Deploying Hadoop Stack

- To deploy Hadoop Stack , execute

``ansible-playbook -i hosts site.yml``

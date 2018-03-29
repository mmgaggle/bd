# TODO

## Services
* Add plays to start/stop common services

## Security
* Use Hadoop Credential Provider for S3A credentials
* Figure out SElinux policy for head node so we can leave it enabled
* Create users instead of using root user
* Verify checksums on tarballs

## EMR Clone 
* Support configurable number of worker/core nodes
* Support for scaling cluster after initial instantiation
* Support for multiple ec2 clusters (filter ec2.py)
* Install and configure Pig
* Install and configure HUE

## Hadoop
* Update Hadoop to 2.8.2

## Spark
* Configure Spark History Server
* 

## Visibility
* Hadoop metrics JMX Collectd plugin
  https://collectd.org/wiki/index.php/Plugin:GenericJMX
* Hadoop Swimlanes
  https://github.com/eastcirclek/swimlane-graphs

## Performance
* Hive tuning (done, but good references)
  https://docs.hortonworks.com/HDPDocuments/HDCloudAWS/HDCloudAWS-1.14.1/bk_hdcloud-aws/content/s3-hive/index.html
  https://www.cloudera.com/documentation/enterprise/latest/topics/admin_hive_on_s3_tuning.html

## Support Kafka Streaming
* Install and configure Zookeeper
* Install and configure Kafka
* Install and configure Secor

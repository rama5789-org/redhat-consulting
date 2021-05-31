# AMQ Broker Cluster :

```sh
---------------------------------------------
# EC2 Instance (Server):

- OS: Red Hat Enterprise Linux 8 (HVM), SSD Volume Type - ami-0a9d27a9f4f5c0efc (64-bit x86)
- Instance Type: "t2.small" 
- Network: vpc-default(mumbai - ap-south-1)
- Subnet: subnet-default(ap-south-1a)
- Security Group: "jboss-cluster-sg"

[ec2-user@ip-172-31-46-240 ~]$ cat /etc/system-release # /etc/os-release
Red Hat Enterprise Linux release 8.3 (Ootpa)

# Download Jboss-eap-7.2.0

$  wget https://access.redhat.com/cspdownload/a62ffe755b3634b9d04ee8f9f70b4607/60b492ba/AMQ-BROKER-7.7.0/amq-broker-7.7.0-bin.zip

$ unzip amq-broker-7.7.0-bin.zip* -d .
# $ rm amq-broker-7.7.0-bin.zip*

# open up broker ports:

$ sudo firewall-cmd --zone=public --add-port=8161/tcp --permanent
$ sudo firewall-cmd --add-port=61616/tcp --permanent
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all

---------------------------------------------------
# Different Machines (Horizontal Cluster):

# Server 1 | 2:

$ hostname
ip-172-31-32-10.ap-south-1.compute.internal
$ hostname -I
172.31.32.10

$./artemis create broker \
    --user rama \
    --password Rama123$ \
    --host `hostname -I` \
    --http-host `hostname -I` \
    --allow-anonymous

Creating ActiveMQ Artemis instance at: /home/ec2-user/amq-broker-7.7.0/bin/broker
You can now start the broker by executing:
   "/home/ec2-user/amq-broker-7.7.0/bin/broker/bin/artemis" run
Or you can run the broker in the background using:
   "/home/ec2-user/amq-broker-7.7.0/bin/broker/bin/artemis-service" start

```
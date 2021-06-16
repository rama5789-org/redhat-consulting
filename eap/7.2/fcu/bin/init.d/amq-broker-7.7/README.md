# AMQ Cluster Implementation on Nodes [10.20.10.14,10.20.10.15] :

```sh
-------------------------------------
# Create Broker:

[rnayak@FCU-R20QAAMQ01 bin]$ sudo su jboss-user
[jboss-user@FCU-R20QAAMQ01 bin]$ pwd
/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin
[jboss-user@FCU-R20QAAMQ01 bin]$ hostname
FCU-R20QAAMQ01
[jboss-user@FCU-R20QAAMQ01 bin]$ hostname -I
10.20.10.14
[jboss-user@FCU-R20QAAMQ01 bin]$ ll
total 12
-rwxr-xr-x. 1 jboss-user jboss-user 2713 Jun 18  2020 artemis
-rwxr-xr-x. 1 jboss-user jboss-user 1945 Jun 18  2020 artemis.cmd
drwxr-xr-x. 4 jboss-user jboss-user 4096 Jun 18  2020 lib
[jboss-user@FCU-R20QAAMQ01 bin]$ ./artemis create broker \
     --user admin \
     --password Admin123$ \
     --host `hostname -I` \
     --http-host `hostname -I` \
     --allow-anonymous
Creating ActiveMQ Artemis instance at: /eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker

Auto tuning journal ...
done! Your system can make 31.25 writes per millisecond, your journal-buffer-timeout will be 32000

You can now start the broker by executing:
   "/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker/bin/artemis" run
Or you can run the broker in the background using:
   "/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker/bin/artemis-service" start

# Modify broker config file:

- Modify "/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker/etc/broker.xml" file as per the requirements.

-------------------------------------
# Firewall Settings:

$ sudo firewall-cmd --zone=public --add-port=8161/tcp --permanent # Connect to AMQ Broker Admin Console
$ sudo firewall-cmd --add-port=61616/tcp --permanent # Communicate with AMQ Broker Clients
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all
:::::
  ports: 8161/tcp 61616/tcp
:::::

# Access Admin Console via Browser:

- Add public ip cors entry in "/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker/etc/jolokia-access.xml".
e.g. <allow-origin>*://127.164.132.130*</allow-origin>

-------------------------------------
# Setup AMQ as a Service:

- https://access.redhat.com/documentation/en-us/red_hat_amq/7.7/html/managing_amq_broker/assembly-using-command-line-interface-managing

$ sudo vi /etc/systemd/system/amqbroker7.service
$ cat /etc/systemd/system/amqbroker7.service
[Unit]
Description=AMQ Broker
After=syslog.target network.target

[Service]
ExecStart=/eap/AMQ_CLUSTER/amq-broker-7.7.0/bin/broker/bin/artemis run
Restart=on-failure
User=jboss-user
Group=jboss-user

# A workaround for Java signal handling
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target

$ sudo systemctl daemon-reload
$ sudo systemctl enable amqbroker7
Created symlink from /etc/systemd/system/multi-user.target.wants/amqbroker7.service to /etc/systemd/system/amqbroker7.service.
$ sudo systemctl start amqbroker7
$ sudo systemctl status amqbroker7 -l
$ sudo systemctl stop amqbroker7

# Validate if broker is running:

$ sudo netstat -tlnup | grep java
tcp6       0      0 10.20.10.14:5672        :::*                    LISTEN      18589/java
tcp6       0      0 10.20.10.14:61613       :::*                    LISTEN      18589/java
tcp6       0      0 10.20.10.14:61616       :::*                    LISTEN      18589/java
tcp6       0      0 10.20.10.14:1883        :::*                    LISTEN      18589/java
tcp6       0      0 10.20.10.14:8161        :::*                    LISTEN      18589/java
tcp6       0      0 10.20.10.14:5445        :::*                    LISTEN      18589/java
```
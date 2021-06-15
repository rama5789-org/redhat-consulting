# Create a Single Node Cluster in (Ubuntu 20.04 | Windows 10) :

## Source Documentation :

- https://activemq.apache.org/components/artemis/documentation/

## Other Helpful Links :

- https://developers.redhat.com/blog/2018/12/06/how-to-integrate-a-remote-red-hat-amq-7-cluster-on-red-hat-jboss-eap-7
- http://www.mastertheboss.com/jboss-server/jboss-jms/how-to-connect-wildfly-to-a-remote-activemq-artemis-server
- https://developers.redhat.com/blog/2018/04/25/automating-amq-7-high-availability-deployment
- https://docs.jboss.org/author/display/WFLY10/Messaging%20configuration.html
- https://stackoverflow.com/questions/39284009/how-to-send-jms-messages-from-wildfly-10-to-remote-activemq
- https://issues.redhat.com/browse/HAL-1608 - Configure enable-amq1-prefix attribute

```sh
---------------------------------------------------
# Same Machine (Vertical Cluster):

$ hostname
kingrama
$ hostname -I   # Windows: ipconfig
172.26.124.89   # 172.26.16.1

# All possible parameters:

$./artemis create broker \
    --user rama \
    --password Rama123$ \
    --host 0.0.0.0 \        # default: localhost
    --http-host 0.0.0.0 \   # default: localhost
    --allow-anonymous \
    --port-offset 100

C:\> artemis create broker --user rama --password Rama123$ --host 172.26.16.1 --http-host 172.26.16.1 --allow-anonymous --port-offset 100

# Server 1:

$./artemis create broker1 \
    --user rama \
    --password Rama123$ \
    --host `hostname -I` \
    --http-host `hostname -I` \
    --allow-anonymous
You can now start the broker by executing:
   "/mnt/c/MyProgramFiles/RedHat/amq-broker-7.7.0/bin/broker1/bin/artemis" run
Or you can run the broker in the background using:
   "/mnt/c/MyProgramFiles/RedHat/amq-broker-7.7.0/bin/broker1/bin/artemis-service" start

# Server 2:

$./artemis create broker2 \
    --user rama \
    --password Rama123$ \
    --host `hostname -I` \
    --http-host `hostname -I` \
    --allow-anonymous \
    --port-offset 100
```

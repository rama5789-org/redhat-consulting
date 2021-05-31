./artemis create broker \
    --user rama \
    --password Rama123$ \
    --http-host 172.31.32.10 \
    --http-port 8161 \
    --allow-anonymous

"/home/ec2-user/amq-broker-7.7.0/bin/broker-1/bin/artemis-service" start
"/home/ec2-user/amq-broker-7.7.0/bin/broker-1/bin/artemis" run

broker.xml

<connectors>
    <connector name="netty-connector">tcp://172.31.32.10:61616</connector>
    <connector name="broker1-connector">tcp://172.31.32.11:61616</connector>
</connectors>
   
<cluster-connections>
    <cluster-connection name="my-cluster">
        <connector-ref>netty-connector</connector-ref>
        <static-connectors>
        <connector-ref>broker1-connector</connector-ref>
        </static-connectors>
    </cluster-connection>
</cluster-connections>

<cluster-user>broker_user</cluster-user>
<cluster-password>broker_passwd</cluster-password>

./artemis create broker \
    --user rama \
    --password Rama123$ \
    --http-host 172.31.32.11 \
    --http-port 8161 \
    --allow-anonymous

<connectors>
    <connector name="netty-connector">tcp://172.31.32.11:61616</connector>
    <connector name="broker1-connector">tcp://172.31.32.10:61616</connector>
</connectors>
   
<cluster-connections>
    <cluster-connection name="my-cluster">
        <connector-ref>netty-connector</connector-ref>
        <static-connectors>
        <connector-ref>broker1-connector</connector-ref>
        </static-connectors>
    </cluster-connection>
</cluster-connections>

<cluster-user>broker_user</cluster-user>
<cluster-password>broker_passwd</cluster-password>
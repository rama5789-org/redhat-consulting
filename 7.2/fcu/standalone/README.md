# Create a Single Node Cluster :

```sh
---------------------------------------------------
# Same Machine (Vertical Cluster) [10.20.10.10]:

$ ./add-user.sh rama Rama123$ 
Added user 'rama' to file '/eap/EAP-7.2.0-test/standalone/configuration/mgmt-users.properties'
Added user 'rama' to file '/eap/EAP-7.2.0-test/domain/configuration/mgmt-users.properties'

# Server 1:

$ ./standalone.sh -c standalone-full-ha.xml \
    -b `hostname -I` \
    -bmanagement 0.0.0.0 \
    -Djboss.server.name=node1 \
    -Djboss.tx.node.id=node1 \
    -Djboss.messaging.cluster.password=Abcd12345

# Server 2:

$ ./standalone.sh -c standalone-full-ha.xml \
    -b `hostname -I` \
    -bmanagement 0.0.0.0 \
    -Djboss.server.name=node2 \
    -Djboss.tx.node.id=node2 \
    -Djboss.messaging.cluster.password=Abcd12345 \
    -Djboss.socket.binding.port-offset=100

$ ./jboss-cli.sh
[disconnected /] connect # same as "connect localhost:9990"
[standalone@localhost:9990 /] /subsystem=jgroups/channel=ee:read-attribute(name=view,include-defaults=true)
{
    "outcome" => "success",
    "result" => "[node1|1] (2) [node1, node2]"
}

[standalone@localhost:9990 /]

```
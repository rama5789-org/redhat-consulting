# Create a Single Node Cluster in Windows 10 :

```sh
---------------------------------------------------
# Kill Server:

$ netstat -ano | find "8080"
$ taskkill -pid 1234 /f

# Node 1:

# Base Dir: C:\MyProgramFiles\RedHat\jboss-eap-7.2\bin>

$ .\add-user.bat rama Rama123$ -up C:\MyProgramFiles\RedHat\vertical-cluster\standalone-node1\configuration\mgmt-users.properties

$ .\standalone.bat -c standalone-full-ha.xml -Djboss.server.base.dir=C:\MyProgramFiles\RedHat\vertical-cluster\standalone-node1 -Djboss.server.name=node1 -Djboss.tx.node.id=node1 -Djboss.messaging.cluster.password=Abcd1234

# -Djboss.tx.node.id=node1 will resolve the below warning:
10:52:26,931 WARN  [org.jboss.as.txn] (ServerService Thread Pool -- 74) WFLYTX0013: The node-identifier attribute on the /subsystem=transactions is set to the default value. This is a danger for environments running multiple servers. Please make sure the attribute value is unique.

# add application.keystore file in below dir:
10:52:30,375 WARN  [org.jboss.as.domain.management.security] (MSC service thread 1-2) WFLYDM0111: Keystore C:\MyProgramFiles\RedHat\vertical-cluster\standalone-node1\configuration\application.keystore not found, it will be auto generated on first use with a self signed certificate for host localhost

---------------------------------------------------
# Node 2:

$ .\add-user.bat rama Rama123$ -up C:\MyProgramFiles\RedHat\vertical-cluster\standalone-node2\configuration\mgmt-users.properties

$ .\standalone.bat -c standalone-full-ha.xml -Djboss.server.base.dir=C:\MyProgramFiles\RedHat\vertical-cluster\standalone-node2 -Djboss.server.name=node2 -Djboss.tx.node.id=node2 -Djboss.socket.binding.port-offset=100 -Djboss.messaging.cluster.password=Abcd1234

```
# Create a Single Node Cluster in Ubuntu 20.04 :

```sh
---------------------------------------------------
# Same Machine (Vertical Cluster):

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04.1 LTS (Focal Fossa)"
::::::

$ cat /etc/hosts
127.0.0.1       localhost
127.0.1.1       kingrama.localdomain    kingrama

$ hostname
kingrama
$ hostname -I
172.26.124.89
$ ip addr show
::::::
4: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:05:69:77 brd ff:ff:ff:ff:ff:ff
    inet 172.26.124.89/20 brd 172.26.127.255 scope global eth0
::::::

# All possible parameters:

$ ./standalone.sh \
    --server-config=standalone-full-ha.xml \ # -c standalone-full-ha.xml
    -Djboss.server.base.dir=/mnt/c/MyProgramFiles/RedHat/vertical-cluster/standalone-node1 \
    -Djboss.bind.address=127.0.0.1 \ # -b 127.0.0.1
    -Djboss.bind.address.management=127.0.0.1 \ # -bmanagement 127.0.0.1
    -Djboss.bind.address.private=127.0.0.1 \ 
    -Djboss.bind.address.unsecure=127.0.0.1 \ 
    -Djboss.server.name=server1 \
    -Djboss.node.name=node1 \
    -Djboss.tx.node.id=txnode1 \
    -Djboss.messaging.cluster.password=Abcd1234 \
    -Djboss.socket.binding.port-offset=100 # adding port offset

# Server 1:

$ ./standalone.sh \
    --server-config=ec2-standalone-full-ha.xml \
    -Djboss.server.base.dir=/mnt/c/MyProgramFiles/RedHat/vertical-cluster/standalone-node1 \
    -Djboss.bind.address=127.0.0.1 \
    -Djboss.bind.address.management=0.0.0.0 \
    -Djboss.bind.address.private=127.0.0.1 \
    -Djboss.bind.address.unsecure=127.0.0.1 \
    -Djboss.server.name=server1 \
    -Djboss.node.name=node1 \
    -Djboss.tx.node.id=txnode1 \
    -Djboss.messaging.cluster.password=Abcd1234

# Server 2:

$ ./standalone.sh \
    --server-config=ec2-standalone-full-ha.xml \
    -Djboss.server.base.dir=/mnt/c/MyProgramFiles/RedHat/vertical-cluster/standalone-node2 \
    -Djboss.bind.address=127.0.0.1 \
    -Djboss.bind.address.management=0.0.0.0 \
    -Djboss.bind.address.private=127.0.0.1 \
    -Djboss.bind.address.unsecure=127.0.0.1 \
    -Djboss.server.name=server2 \
    -Djboss.node.name=node2 \
    -Djboss.tx.node.id=txnode2 \
    -Djboss.messaging.cluster.password=Abcd1234 \
    -Djboss.socket.binding.port-offset=100
    
```
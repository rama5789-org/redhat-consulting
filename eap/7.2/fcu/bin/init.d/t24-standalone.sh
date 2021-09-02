#!/bin/bash

hostip="127.0.0.1"

# get assigned private ip:
getHostIP() {
 echo "pre-while-hostip-$hostip"
 while [ $hostip != "10.20.10.10" ]
  do
   echo "do-hostip-$hostip"
   sleep 5
   hostip=$(hostname -I)
  done
 echo "done-hostip-$hostip"
}
getHostIP

# constants:
initial_hosts="10.20.10.10[7600],10.20.10.11[7600]"
messaging_cluster_password="Abcd1234"
jgroups_tcp_password="Wxyz1234"

# start server:
sh /eap/DEMO_EAP_CLUSTER/jboss-eap-7.2/bin/standalone.sh --server-config=t24-standalone-full-ha.xml -Djboss.bind.address=$hostip -Djboss.bind.address.management=$hostip -Djboss.bind.address.private=$hostip -Djboss.bind.address.unsecure=$hostip -Djboss.server.name=Server-$hostip -Djboss.node.name=Node-$hostip -Djboss.tx.node.id=TxNode-$hostip -Djboss.messaging.cluster.password=$messaging_cluster_password -Dcustom.jboss.jgroups.tcp.password=$jgroups_tcp_password -Dcustom.jboss.jgroups.tcp.initial_hosts=$initial_hosts
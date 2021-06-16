# EAP Cluster Implementation on Nodes [10.20.13.10,10.20.13.11] :

```sh
-------------------------------------
# Setup Server:

# Create | Update admin-user:

$ ./add-user.sh admin Admin123$
Added user 'admin' to file '/eap/EAP_CLUSTER/EAP-7.2.0/standalone/configuration/mgmt-users.properties'
Added user 'admin' to file '/eap/EAP_CLUSTER/EAP-7.2.0/domain/configuration/mgmt-users.properties'

-------------------------------------
# Firewall Settings:

$ sudo firewall-cmd --zone=public --add-port=9990/tcp --permanent # Connect to EAP Admin Console
$ sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent # Connect to EAP Applications
$ sudo firewall-cmd --add-port=7600/tcp --permanent # Communicate with EAP Cluster Members
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all
:::::
  ports: 9990/tcp 8080/tcp 7600/tcp 61616/tcp
:::::

-------------------------------------
# Setup EAP as a Service:

$ sudo vi /etc/systemd/system/jbosseap7.service
$ cat /etc/systemd/system/jbosseap7.service
[Unit]
Description=JBoss EAP
After=NetworkManager.service

[Service]
Type=simple
User=jboss-user
Group=jboss-user
ExecStart=/bin/sh /eap/EAP_CLUSTER/EAP-7.2.0/bin/init.d/t24-standalone.sh
Restart=always
RestartSec=5
TimeoutStartSec=5
TimeoutStopSec=5

[Install]
WantedBy=multi-user.target

$ sudo systemctl daemon-reload
$ sudo systemctl enable jbosseap7
Created symlink from /etc/systemd/system/multi-user.target.wants/jbosseap7.service to /etc/systemd/system/jbosseap7.service.
$ sudo systemctl start jbosseap7
$ sudo systemctl status jbosseap7 -l
$ sudo systemctl stop jbosseap7

# Validate if server is running:

$ sudo netstat -tlnup | grep java
tcp        0      0 10.20.13.10:7600        0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:8080        0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:8443        0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:40095       0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:9990        0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:3528        0.0.0.0:*               LISTEN      888/java
tcp        0      0 10.20.13.10:8009        0.0.0.0:*               LISTEN      888/java
udp        0      0 224.0.1.105:23364       0.0.0.0:*                           888/java

```
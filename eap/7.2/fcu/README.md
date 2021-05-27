# FirstOntario Credit Union (FCU) :

- https://www.firstontario.com

# FCU Urls :

```sh
---------------------------------------------------
# Access to Secure Web Server:
- https://hostip:8443/

# Temenos Browser Client Url:
- https://hostip:8443/r20qa/servlet/BrowserServlet

# TAFJ Session Monitor:
- https://hostip:8370/SessionMonitor

# TAFJEE:
- https://hostip:8443/TAFJEE/
```

# Wiki :

```sh
---------------------------------------------------
# Miscellaneous:

https://www.computerworld.com/article/2701512/how-to-prevent-ssh-from-timing-out.html
https://rm3bukz.ga/book.php?id=cqjWDQAAQBAJ - Mastering JBoss Enterprise Application Platform 7
by Francesco Marchioni

# Run EAP as a Red Hat service:

https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.0/html/installation_guide/configuring_jboss_eap_to_run_as_a_service
https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/

# Redhat cluster:

http://middlewaremagic.com/jboss/?p=1952
https://access.redhat.com/solutions/18601 - initiate a graceful shutdown of JBoss EAP 7/6
https://access.redhat.com/solutions/1320133 - execute the JBoss EAP 6/7 using Systemctl
https://access.redhat.com/solutions/2339831 - standalone cluster mode
https://github.com/tqvarnst/jboss-eap7-summit-lab/blob/master/exercise6-high-availability.adoc
https://access.redhat.com/solutions/869823 - cluster view
https://access.redhat.com/solutions/46373 - sample app to test cluster mode
https://access.redhat.com/solutions/698063 - Debug logging
https://access.redhat.com/solutions/3021711 - TCP Clustering
https://access.redhat.com/solutions/4284751 - The size of duplicate cache detection 
https://access.redhat.com/solutions/337963 -  change the log level jgroups / infinispan
https://access.redhat.com/solutions/24898 - Enable session replication
https://access.redhat.com/solutions/3895201 - keystore not found
https://access.redhat.com/documentation/en-us/reference_architectures/2017/html-single/configuring_a_red_hat_jboss_eap_7_cluster/index - domain cluster mode
https://access.redhat.com/solutions/384393 - Periodic size rotating log handler
https://access.redhat.com/labs/logreaper/ - log analyzer
https://access.redhat.com/solutions/47017 - JBoss Clustering doesn,t work while binding it,s nodes to 0.0.0.0
https://access.redhat.com/solutions/796323 - Deleting the data and tmp directories Before Each Restart of JBoss EAP is Not Recommended

https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.2/html/development_guide/clustering_in_web_applications



https://access.redhat.com/documentation/en-us/red_hat_application_migration_toolkit/4.3/html/cli_guide/getting_started

# Others:

https://stackoverflow.com/questions/39327229/amq119099-unable-to-authenticate-cluster-user-activemq-cluster-admin-user

```
# RHEL Commands :

```sh
---------------------------------------------------
# RHEL Commands:

# Red Hat version:

$ cat /etc/system-release
Red Hat Enterprise Linux Server release 7.9 (Maipo)

# hostname | ip:

$ hostname
FCU-R20QAAPP01

$ hostname -I # same as below
$ ip addr show | grep ens192 -A 2 | head -n 3 | tail -n 1 | awk '{ print $2 }' | sed "s-/24--g" | cut -d'/' -f1
10.20.10.10

# disk file info:

[rnayak@FCU-R20QAAPP01 ~]$ df -h
Filesystem             Size  Used Avail Use% Mounted on
devtmpfs               3.9G     0  3.9G   0% /dev
tmpfs                  3.9G     0  3.9G   0% /dev/shm
tmpfs                  3.9G   34M  3.8G   1% /run
tmpfs                  3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/mapper/rhel-root   50G  2.3G   48G   5% /
/dev/sde1               25G   45M   24G   1% /scripts
/dev/sdc1               59G   19G   38G  33% /transact
/dev/sdb1               79G   19G   56G  26% /eap
/dev/sdd1               59G  709M   56G   2% /TAFJ_LOG
/dev/sda1             1014M  232M  783M  23% /boot
/dev/mapper/rhel-home   67G  254M   67G   1% /home
tmpfs                  783M     0  783M   0% /run/user/1001
tmpfs                  783M     0  783M   0% /run/user/514628112
tmpfs                  783M     0  783M   0% /run/user/514628735

[rnayak@FCU-R20QAAPP01 ~]$ cd /
[rnayak@FCU-R20QAAPP01 /]$ ls -ltr
total 36
drwxr-xr-x.   2 root       root          6 Dec 14  2017 srv
drwxr-xr-x.   2 root       root          6 Dec 14  2017 opt
drwxr-xr-x.   2 root       root          6 Dec 14  2017 media
lrwxrwxrwx.   1 root       root          7 May  2  2019 bin -> usr/bin
lrwxrwxrwx.   1 root       root          9 May  2  2019 lib64 -> usr/lib64
lrwxrwxrwx.   1 root       root          7 May  2  2019 lib -> usr/lib
lrwxrwxrwx.   1 root       root          8 May  2  2019 sbin -> usr/sbin
drwxr-xr-x.  13 root       root        155 May  2  2019 usr
drwxr-xr-x.  19 root       root        267 May  2  2019 var
drwxr-xr-x.   3 root       root         20 May  7  2019 mnt
dr-xr-x---.   3 root       root        168 Jan 26 15:38 root
drwxr-xr-x.   3 root       root       4096 Feb  9 14:55 scripts
drwxrwxr-x.   5 jboss-user jboss-user 4096 Feb 16 16:48 TAFJ_LOG
drwxrwxr-x.  30 jboss-user jboss-user 4096 Feb 17 14:29 transact
drwxrwxr-x.   5 jboss-user jboss-user 4096 Feb 17 17:28 eap
dr-xr-xr-x. 164 root       root          0 Mar  5 12:01 proc
dr-xr-xr-x.  13 root       root          0 Mar  5 12:01 sys
drwxr-xr-x.  19 root       root       3360 Mar  5 12:01 dev
dr-xr-xr-x.   4 root       root       4096 Mar  5 12:02 boot
drwxr-xr-x.  90 root       root       8192 Mar 29 13:03 etc
drwxr-xr-x.  28 root       root        840 Apr  9 14:08 run
drwxr-xr-x.  17 root       root        234 Apr 13 08:31 home
drwxrwxrwt.  14 root       root       4096 Apr 14 10:26 tmp
[rnayak@FCU-R20QAAPP01 /]$

# Login as Root User:

[rnayak@FCU-R20QAAPP02 ~]$ sudo -s
[root@FCU-R20QAAPP02 rnayak]#

# Login as Jboss User:

[rnayak@FCU-R20QAAPP02 ~]$ sudo su jboss-user
[jboss-user@FCU-R20QAAPP02 rnayak]$

$ sudo su - jboss-user # home dir
$ sudo su jboss-user # pwd dir
Last login: Tue Apr 13 13:21:30 EDT 2021 on pts/2

[jboss-user@FCU-R20QAAPP01 ~]$ ls -la # ls -lrth (includes the file size)
total 24
drwx------.  3 jboss-user jboss-user  117 Apr 13 08:56 .
drwxr-xr-x. 17 root       root        234 Apr 13 08:31 ..
-rw-------.  1 jboss-user jboss-user 6990 Apr 13 13:28 .bash_history
-rw-r--r--.  1 jboss-user jboss-user   18 May 22  2018 .bash_logout
-rw-r--r--.  1 jboss-user jboss-user  775 Apr 13 08:56 .bash_profile
-rw-r--r--.  1 jboss-user jboss-user  231 May 22  2018 .bashrc
drwxr-xr-x.  3 jboss-user jboss-user   19 Jan 26 17:38 .java
-rw-rw-r--.  1 jboss-user jboss-user  408 Mar  3 11:59 .TAFJ_DBTools

[jboss-user@FCU-R20QAAPP01 ~]$ more .bash_profile
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

export JAVA_HOME=/transact/java
export TAFJ_HOME=/transact/TAFJ
export LOG_HOME=/transact/log

export UTP_HOME=/transact/.
export UTP_TOOL_HOME=$UTP_HOME/../tools/utptool
export PATH=$JAVA_HOME/bin:$TAFJ_HOME/bin:$PATH
export TAFJ_LOG_HOME=$TAFJ_HOME/log
export T24_LOG_HOME=$TAFJ_HOME/log_T24
export T24_HOME=/transact/T24/UD
BRP_HOME=$UTP_HOME/BRP; export BRP_HOME

export LOG_DIRECTORY=$T24_LOG_HOME
export LOG_DIRECTORY_T24=$T24_LOG_HOME

export PACKAGE=$T24_HOME/package
export DS_PACKAGE_UPDATES=$T24_HOME/DSPackageUpdates

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$TAFJ_HOME/bin:$JAVA_HOME/bin:$T24_HOME/updater/bin

export PATH
[jboss-user@FCU-R20QAAPP01 ~]$

---------------------------------------------------
# ping, telnet, ssh | scp, curl:

# File | Directory transfer from local to remote:

$ scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null development.war rnayak@127.196.215.247:  
Warning: Permanently added '127.196.215.247' (ECDSA) to the list of known hosts.
rnayak@127.196.215.247,s password:
development.war                                                                                    100% 5227     7.5KB/s   00:00

$ scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r Sample_Jars/* rnayak@127.196.215.247:Sample_Jars

# File | Directory transfer from remote machine-1 to remote machine-2:

# machine-2:
[rnayak@FCU-R20QAAPP02 ~]$ mkdir EAP-7.2.0-test
# machine-1:
[root@FCU-R20QAAPP01 eap]$ scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r EAP-7.2.0-test/* rnayak@10.20.10.11:EAP-7.2.0-test
# machine-2:
[rnayak@FCU-R20QAAPP02 ~]$ ll EAP-7.2.0-test/
[rnayak@FCU-R20QAAPP02 ~]$ sudo -s
[root@FCU-R20QAAPP02 rnayak]$ mv EAP-7.2.0-test/ /eap
[root@FCU-R20QAAPP02 rnayak]$ cd /eap
[root@FCU-R20QAAPP02 eap]$ ll
drwxr-xr-x. 15 jboss-user jboss-user    4096 May  3  2019 EAP-7.2.0
drwxr-xr-x. 12 rnayak     domain users  4096 May  6 06:16 EAP-7.2.0-test
[root@FCU-R20QAAPP02 eap]$ chown -R jboss-user:jboss-user EAP-7.2.0-test/ # chown user:group file|dir
[root@FCU-R20QAAPP02 eap]$ ll
drwxr-xr-x. 15 jboss-user jboss-user  4096 May  3  2019 EAP-7.2.0
drwxr-xr-x. 12 jboss-user jboss-user  4096 May  6 06:16 EAP-7.2.0-test

# File | Directory transfer from remote to local:

$ scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null rnayak@127.196.215.247:read.txt . 
$ scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r rnayak@127.196.215.247:configuration . 

# AWS:

$ sudo ssh -i "jboss-cluster.pem" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ec2-user@13.232.247.113

# curl nice header output:

$ curl -L -v -s -o /dev/null http://127.31.227.230:9990/
$ curl -Lvso /dev/null http://127.31.227.230:9990/
-L, --location follow redirects
-v, --verbose more output, indicates the direction
-s, --silent don,t show a progress bar
-o, --output /dev/null don,t show received body

# curl ignore certificates:

$ curl -k https://127.31.227.230:8443/counter

---------------------------------------------------
# zip | unzip : jar, war, ear, rar:

# File listing:

$ unzip -l my.war

# Update a single file
# If you need to pull out a single file, modify it, then put it back in the archive:

$ unzip my.war WEB-INF/web.xml -d .
$ vi WEB-INF/web.xml    # add <distributable /> tag inside <web-app>
$ zip my.war WEB-INF/web.xml

# You can validate the content was changed using the command below, which just outputs the content from the archive to stdout.

$ unzip -p my.war WEB-INF/web.xml
$ rm -rf WEB-INF/

```
# Start and Stop JBOSS EAP Manually :

```sh
---------------------------------------------------
# RHEL Commands:

Using username "RNayak".
Last login: Tue Apr 27 06:54:26 2021 from securelinkprod.firstontario.com

[root@FCU-R20QAAPP01 rnayak]$ netstat -tulpn | grep LISTEN
[rnayak@FCU-R20QAAPP01 ~]$ sudo netstat -tlunp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN      1696/master
tcp        0      0 0.0.0.0:8443            0.0.0.0:*               LISTEN      31171/java
tcp        0      0 0.0.0.0:9990            0.0.0.0:*               LISTEN      31171/java
tcp        0      0 0.0.0.0:3528            0.0.0.0:*               LISTEN      31171/java
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      31171/java
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1149/sshd
tcp6       0      0 :::8377                 :::*                    LISTEN      8503/java
tcp6       0      0 ::1:25                  :::*                    LISTEN      1696/master
tcp6       0      0 :::8370                 :::*                    LISTEN      8503/java
tcp6       0      0 :::22                   :::*                    LISTEN      1149/sshd
udp        0      0 10.20.10.10:123         0.0.0.0:*                           811/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*                           811/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*                           811/ntpd
udp6       0      0 fe80::f8b2:961f:9f9:123 :::*                                811/ntpd
udp6       0      0 ::1:123                 :::*                                811/ntpd
udp6       0      0 :::123                  :::*                                811/ntpd

[rnayak@FCU-R20QAAPP01 ~]$ sudo ss -tlunp | grep 8443
tcp    LISTEN     0      128       *:8443                  *:*                   users:(("java",pid=31171,fd=904))

[rnayak@FCU-R20QAAPP01 ~]$ sudo ps -lax | grep 31171
0 514628735 22090 21797 20 0 112808  976 pipe_w S+   pts/2      0:00 grep --color=auto 31171
0  1000 31171 31099  20   0 8780188 2490108 futex_ Sl ?         4:56 java -D[Standalone] -server -verbose:gc -Xloggc:/eap/EAP-7.2.0/standalone/log/gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=3M -XX:-TraceClassUnloading -Xms3G -Xmx6G -XX:MetaspaceSize=128M -XX:MaxMetaspaceSize=512m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true -Dorg.jboss.boot.log.file=/eap/EAP-7.2.0/standalone/log/server.log -Dlogging.configuration=file:/eap/EAP-7.2.0/standalone/configuration/logging.properties -jar /eap/EAP-7.2.0/jboss-modules.jar -mp /eap/EAP-7.2.0/modules org.jboss.as.standalone -Djboss.home.dir=/eap/EAP-7.2.0 -Djboss.server.base.dir=/eap/EAP-7.2.0/standalone

[rnayak@FCU-R20QAAPP01 ~]$ sudo kill -9 31171

# Shortcut for "sudo ss -tlunp | grep 8443" and "sudo kill -9 31171":

$ sudo kill -9 $(sudo ss -tlunp | grep 8443 | awk '{ print $7 }' | awk -F"," '{ print $2 }' | awk -F"=" '{ print $2 }')
$ kill -9 $(ss -tlunp | grep 8443 | awk '{ print $7 }' | awk -F"," '{ print $2 }' | awk -F"=" '{ print $2 }')

# Kill all Java applications:

$ sudo killall -9 java

[rnayak@FCU-R20QAAPP01 ~]$ cd /eap/EAP-7.2.0/bin
[rnayak@FCU-R20QAAPP01 ~]$ ./standalone.sh &>/dev/null &
[1] 31099

# Firewall add and remove rules:

[rnayak@FCU-R20QAAPP01 ~]$ sudo firewall-cmd --permanent --add-port=7600/tcp
success
[rnayak@FCU-R20QAAPP01 ~]$ sudo firewall-cmd --reload
success
[rnayak@FCU-R20QAAPP01 ~]$ sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: ens192
  sources:
  services: dhcpv6-client jboss-https jboss-mgmt ssh
  ports: 8370/tcp 7600/tcp
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
[rnayak@FCU-R20QAAPP01 ~]$ sudo firewall-cmd --permanent --remove-port=7600/tcp
success
[rnayak@FCU-R20QAAPP01 ~]$ sudo firewall-cmd --reload
success

# Expose 8543, 10090 ports:

$ sudo firewall-cmd --list-all
$ sudo firewall-cmd --zone=public --add-port=8543/tcp --permanent
$ sudo firewall-cmd --zone=public --add-port=10090/tcp --permanent
$ sudo firewall-cmd --reload
$ sudo firewall-cmd --list-all

```

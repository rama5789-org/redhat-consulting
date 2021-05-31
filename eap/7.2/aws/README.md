# Setup JDK (RHEL 8):

```sh
---------------------------------------------------
# OpenJDK JRE | JDK installation:

$ cat /etc/system-release
Red Hat Enterprise Linux release 8.4 (Ootpa)

$ cat /etc/os-release
NAME="Red Hat Enterprise Linux"
VERSION="8.4 (Ootpa)"
ID="rhel"
ID_LIKE="fedora"
VERSION_ID="8.4"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Red Hat Enterprise Linux 8.4 (Ootpa)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:8.4:GA"
HOME_URL="https://www.redhat.com/"
DOCUMENTATION_URL="https://access.redhat.com/documentation/red_hat_enterprise_linux/8/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 8"
REDHAT_BUGZILLA_PRODUCT_VERSION=8.4
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="8.4"

$ sudo yum search java
java-1.8.0-openjdk.x86_64 : OpenJDK 8 Runtime Environment
java-1.8.0-openjdk-devel.x86_64 : OpenJDK 8 Development Environment
java-11-openjdk.x86_64 : OpenJDK 11 Runtime Environment
java-11-openjdk-devel.x86_64 : OpenJDK 11 Development Environment

$ sudo yum install -y java-1.8.0-openjdk.x86_64

$ java -version
openjdk version "1.8.0_292"
OpenJDK Runtime Environment (build 1.8.0_292-b10)
OpenJDK 64-Bit Server VM (build 25.292-b10, mixed mode)

$ alternatives --display java
java - status is auto.
 link currently points to /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64/jre/bin/java
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64/jre/bin/java - family java-1.8.0-openjdk.x86_64 priority 1800292
 slave jre: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64/jre
::::::::::::

$ which java
/usr/bin/java

$ whereis java
java: /usr/bin/java /usr/lib/java /etc/java /usr/share/java /usr/share/man/man1/java.1.gz

$ ll /usr/bin | grep java
lrwxrwxrwx. 1 root root       26 May 31 05:43 alt-java -> /etc/alternatives/alt-java
lrwxrwxrwx. 1 root root       22 May 31 05:43 java -> /etc/alternatives/java

# Traverse through all Symbolic links:

$ ls -l /usr/bin/java
lrwxrwxrwx. 1 root root 22 May 31 05:43 /usr/bin/java -> /etc/alternatives/java

$ ls -l /etc/alternatives/java
lrwxrwxrwx. 1 root root 73 May 31 05:43 /etc/alternatives/java -> /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el8_4.x86_64/jre/bin/java

# Search for Java in the Installed Packages List:

$ sudo yum list | grep java-1.8.0-openjdk.x86_64
java-1.8.0-openjdk.x86_64                              1:1.8.0.292.b10-1.el8_4                             @rhel-8-appstream-rhui-rpms
```
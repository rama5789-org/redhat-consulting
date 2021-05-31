# Setup JDK (Ubuntu 20.04):

```sh
---------------------------------------------------
# OpenJDK JRE | JDK installation:

$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.1 LTS"

$ cat /etc/os-release
NAME="Ubuntu"
VERSION="20.04.1 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.1 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

$ sudo apt-cache search openjdk
default-jdk - Standard Java or Java compatible Development Kit
openjdk-11-jdk - OpenJDK Development Kit (JDK)
openjdk-8-jdk - OpenJDK Development Kit (JDK)

$ sudo apt install openjdk-8-jdk

$ java -version
openjdk version "1.8.0_292"
OpenJDK Runtime Environment (build 1.8.0_292-8u292-b10-0ubuntu1~20.04-b10)
OpenJDK 64-Bit Server VM (build 25.292-b10, mixed mode)

$ sudo update-alternatives --list java
/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

$ sudo update-alternatives --config java
There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
Nothing to configure.

$ which java
/usr/bin/java

$ whereis java
java: /usr/bin/java /usr/share/java /usr/share/man/man1/java.1.gz

$ ll /usr/bin | grep java
lrwxrwxrwx  1 root   root          22 May  7 18:56 java -> /etc/alternatives/java*

# Traverse through all Symbolic links:

$ ls -l /usr/bin/java
lrwxrwxrwx 1 root root 22 May  7 18:56 /usr/bin/java -> /etc/alternatives/java

$ ls -l /etc/alternatives/java
lrwxrwxrwx 1 root root 46 May  7 18:56 /etc/alternatives/java -> /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# Search for Java in the Installed Packages List:

$ sudo apt list --installed | grep -i openjdk
openjdk-8-jdk-headless/focal-updates,focal-security,now 8u292-b10-0ubuntu1~20.04 amd64 [installed,automatic]
openjdk-8-jdk/focal-updates,focal-security,now 8u292-b10-0ubuntu1~20.04 amd64 [installed]
openjdk-8-jre-headless/focal-updates,focal-security,now 8u292-b10-0ubuntu1~20.04 amd64 [installed]
openjdk-8-jre/focal-updates,focal-security,now 8u292-b10-0ubuntu1~20.04 amd64 [installed,automatic]

$ sudo dpkg --list | grep -i openjdk
ii  openjdk-8-jdk:amd64                   8u292-b10-0ubuntu1~20.04           amd64        OpenJDK Development Kit (JDK)
ii  openjdk-8-jdk-headless:amd64          8u292-b10-0ubuntu1~20.04           amd64        OpenJDK Development Kit (JDK) (headless)
ii  openjdk-8-jre:amd64                   8u292-b10-0ubuntu1~20.04           amd64        OpenJDK Java runtime, using Hotspot JIT
ii  openjdk-8-jre-headless:amd64          8u292-b10-0ubuntu1~20.04           amd64        OpenJDK Java runtime, using Hotspot JIT (headless)

---------------------------------------------------
# OpenJDK JRE | JDK uninstallation:

$ sudo apt remove openjdk-8-jdk

```
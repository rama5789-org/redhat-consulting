# Setup JDK (Ubuntu 20.04):

```sh
---------------------------------------------------
# OpenJDK JRE | JDK installation:

$ sudo apt install openjdk-8-jre-headless # or, openjdk-8-jdk-headless

$ java -version
openjdk version "1.8.0_292"
OpenJDK Runtime Environment (build 1.8.0_292-8u292-b10-0ubuntu1~20.04-b10)
OpenJDK 64-Bit Server VM (build 25.292-b10, mixed mode)

$ update-alternatives --list java
/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

$ which java
/usr/bin/java

$ whereis java
java: /usr/bin/java /usr/share/java /usr/share/man/man1/java.1.gz

# Traverse through all Symbolic links:

$ ls -l /usr/bin/java
lrwxrwxrwx 1 root root 22 May  7 18:56 /usr/bin/java -> /etc/alternatives/java

$ ls -l /etc/alternatives/java
lrwxrwxrwx 1 root root 46 May  7 18:56 /etc/alternatives/java -> /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# Search for Java in the Installed Packages List:

$ sudo apt list --installed | grep -i openjdk
openjdk-8-jre-headless/focal-updates,focal-security,now 8u292-b10-0ubuntu1~20.04 amd64 [installed]

```
# PAM Installation :

- https://access.redhat.com/documentation/en-us/red_hat_process_automation_manager/7.11/html/installing_and_configuring_red_hat_process_automation_manager/assembly_installing-on-eap-deployable_install-on-eap
- https://developers.redhat.com/articles/2020/11/19/red-hat-process-automation-manager-eap
- https://access.redhat.com/articles/3405381#RHPAM711 (Red Hat Process Automation Manager 7 Supported Configurations)
- https://access.redhat.com/solutions/6324271 (jar installer installation fails with "Cannot start embedded Host Controller")

```sh
---------------------------------------------------
# Java version:

$ java -version
java version "11.0.11" 2021-04-20 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.11+9-LTS-194)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.11+9-LTS-194, mixed mode)

---------------------------------------------------
# Download below files:

- jboss-eap-7.3.0.zip
- jboss-eap-7.3.6-patch.zip
- rhpam-installer-7.11.0.jar

# extract jboss-eap-7.3.0.zip to pam-7.11 location:

/pam-7.11/bin$ ./add-user.sh rama Rama123$
/pam-7.11/bin$ ./standalone.sh

# Once server started:

- Open EAP admin console - "http://127.0.0.1:9990/"
- Goto "Patching" - "Add Patch" > "jboss-eap-7.3.6-patch.zip"

# Once patching done, stop the server.

# Run the installer - "rhpam-installer-7.11.0.jar"

# After successful installation, start the server again:

/pam-7.11/bin$ ./standalone.sh -c standalone-full.xml

- Open PAM Console - "http://127.0.0.1:8080/business-central"
- "Username" - rhpamAdmin (Roles - admin,kie-server,rest-all)
- "Password" - RhpamAdmin123$

/pam-7.11/standalone/configuration$ cat application-roles.properties
rhpamAdmin=admin,kie-server,rest-all
controllerUser=kie-server,rest-all

/pam-7.11/standalone/configuration$ cat application-users.properties
rhpamAdmin=6c6b00dba19cde22ae8bf271c70feaa2
controllerUser=27e34bd14efaa100775250719c2f20b4

```

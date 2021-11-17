# PAM Installation :

- https://access.redhat.com/documentation/en-us/red_hat_process_automation_manager/7.11/html/installing_and_configuring_red_hat_process_automation_manager/assembly_installing-on-eap-deployable_install-on-eap
- https://developers.redhat.com/articles/2020/11/19/red-hat-process-automation-manager-eap
- https://access.redhat.com/articles/3405381#RHPAM711 (Red Hat Process Automation Manager 7 Supported Configurations)
- https://access.redhat.com/solutions/6324271 (jar installer installation fails with "Cannot start embedded Host Controller")

## Articles

- https://jeftaylo.medium.com/expose-niogit-from-red-hat-business-central-2b28a9e7fb67
- https://jeftaylo.medium.com/creating-maven-projects-that-can-be-imported-into-red-hat-business-central-8fb9e8d63d70
- https://jeftaylo.medium.com/bpmn-timers-red-hat-process-automation-manager-and-postgresql-11-e67cd7d8b613
- https://jeftaylo.medium.com/rhpam-on-openshift-d27629796202

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

# PAM DB Setup :

```sh
---------------------------------------------------
# "standalone-full.xml" file changes:
# Add below "system-properties" and also add postgres "datasource" and "driver":
<system-properties>
    ::::::::::
    <property name="org.kie.server.persistence.ds" value="java:jboss/datasources/KieServerDS"/>
    <property name="org.kie.server.persistence.dialect" value="org.hibernate.dialect.PostgreSQLDialect"/>
</system-properties>

# Add "module.xml" in /eap/modules/system/layers/base/com/postgresql/main Dir with "postgres driver jar"

# Create a Database "jbpm" in postgres DB.
# Run "postgresql-jbpm-schema.sql" in /rhpam-7.11.0-add-ons/rhpam-7.11.0-migration-tool/ddl-scripts/postgresql Dir.

```

# Deploying PAM in Openshift :

- https://access.redhat.com/documentation/en-us/red_hat_process_automation_manager/7.11/html/deploying_red_hat_process_automation_manager_on_red_hat_openshift_container_platform/index


### 2.5.1 Setup Prompt
The `setup.py` script will bring up a prompt to provide information for certificate as well as the IP Address and the hostname for the Gluu Server. The prompt is given below.

```
Enter IP Address [192.168.122.60] :
Enter hostname [localhost] : centos.gluu.info
Enter your city or locality : Austin
Enter your state or province two letter code : TX
Enter two letter Country Code : US
Enter Organization Name : Gluu
Enter email address for support at your organization : support@gluu.org
Enter maximum RAM for tomcat in MB [3072] :
Optional: enter password for oxTrust and LDAP superuser [hlE3vzf0hMdD] :
Install oxAuth OAuth2 Authorization Server? [Yes] :
Install oxTrust Admin UI? [Yes] :
Install Gluu OpenDJ LDAP Server? [Yes] :
Install Apache HTTPD Server [Yes] :
Install Shibboleth SAML IDP? [No] :
Install Asimba SAML Proxy? [No] :
Install CAS? [No] :
Install oxAuth RP? [No] :
```

It is recommended to use `hostname.domain` structure for hostname and refrain from using `127.x.x.x` for IP address. 
If you are not using a resolvable DNS host, you will need to add the hostname to your hosts file on the server which is running your browser. Login with the default user name `admin` and the password printed back in the confirmation (also contained in `setup.properties.last` (use the Unix command `grep --color -i pass` to find the according line quickly) and look for the LDAP password which is the same as the admin password.

Make sure you remove or encrypt setup.properties.last It has the clear text passwords for everything: *LDAP, admin user, keystores, and 3DES salt*. If something goes wrong, check `setup.log` for a detailed step-by-step of the installation. As an alternative you may check the file `setup_errors.log` to just see the errors (or stderr output from the scripts).

!!! warning
    Use a FQDN (fully qualified domain name) as hostname and refrain from using 127.0.0.1 as IP address

### 2.5.2 Script Command Line Options
The `setup.py` script can be used to configure your Gluu Server and to add initial data
for oxAuth and oxTrust to start. If `setup.properties` is found
in this folder, these properties will automatically be used instead of
the interactive setup.

The administrator can use the following command line options to include additional components:

* __-a__ install Asimba
* __-c__ install CAS
* __-d__ specify the directory where community-edition-setup is located. Defaults to '.'
* __-f__ specify `setup.properties` file
* __-h__ invoke this help
* __-l__ install LDAP
* __-n__ no interactive prompt before install starts. Run with `-f`
* __-N__ no Apache httpd server
* __-s__ install the Shibboleth IDP
* __-u__ update hosts file with IP address/hostname
* __-w__ get the development head war files

Example Command: `# ./setup.py -cas` This command will install Gluu Server with CAS, Asimba and Shibboleth IDP.

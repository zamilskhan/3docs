# Install Gluu Server
Gluu Server CE is shipped in packages prepared for Ubuntu, CentOS, RHEL and Debian. The package installation follows the general procedure of adding the repo followed by the addition of RPM GPG key and finally installing with the `apt-get` or `yum install` command.

## Ubuntu
### Ubuntu Server 14.04
The following commands will install Gluu Server `chroot`

|       Command Description     |               Trusty Commands         |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |echo "deb https://repo.gluu.org/ubuntu/ trusty main" > /etc/apt/sources.list.d/gluu-repo.list|
|       Add Gluu GPG Key        |curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -|
|       Update/Clean Repo       |apt-get update                         |
|       Install Gluu Server     |apt-get install gluu-server-2.4.4      |
|       Gluu Server Status      |/etc/init.d/gluu-server-2.4.4 status   |

!!! Note: While entering the "deb" command manually, make sure to enter an extra space between "/ubuntu/" and "trusty main". It is recommended to copy and paste the commands.

Please see section 2.1.3 to complete installation.

### Ubuntu Server 16.04

The following commands will install Gluu Server `chroot`

|       Command Description     |               Xenial Commands         |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |echo "deb https://repo.gluu.org/ubuntu/ xenial main" > /etc/apt/sources.list.d/gluu-repo.list|
|       Add Gluu GPG Key        |curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -|
|       Update/Clean Repo       |apt-get update                         |
|       Install Gluu Server     |apt-get install gluu-server-2.4.4      |
|       Gluu Server Status      |/etc/init.d/gluu-server-2.4.4 status   |

!!! Note: While entering the "deb" command manually, make sure to enter an extra space between "/ubuntu/" and "trusty main". It is recommended to copy and paste the commands.

Please see section 2.1.3 to complete installation.

### Complete Installation
The setup is completed by running the setup script `setup.py` from the setup folder. The server must be running so that the administrator can log into the chroot environment and run the script.

* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               Trusty & Xenial Commands|
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/etc/init.d/gluu-server-2.4.4 start    |
|       Log into Gluu `chroot`  |/etc/init.d/gluu-server-2.4.4 login    |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|
|	Gluu Server Status	|/etc/init.d/gluu-server-2.4.4 status	|

### Uninstall Gluu Server
Gluu Server uninstallation follows the same principle as package removal from Ubuntu. The server must be stopped to remove the package.

|       Command Description     |               Trusty & Xenial Commands|
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/etc/init.d/gluu-server-2.4.4 stop     |
|       Uninstall Gluu Server   |apt-get remove gluu-server-2.4.4       |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

## CentOS
### CentOS 6.5

The following commands will install Gluu Server `chroot`. The supported versions include 6.6,6.7 and 6.8

|       Command Description     |               CentOS 6.x              |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/centos/Gluu-centos6.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Import GPG Key          |rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

### CentOS 7.2
The following commands will install Gluu Server `chroot`


|       Command Description     |               CentOS 7.2              |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/centos/Gluu-centos7.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Import GPG Key          |rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

### Complete Installation
The setup is completed by running the setup script `setup.py` from the setup folder. The server must be running so that the administrator can log into the chroot environment and run the script. The commands differ in CentO 6.x and CentOS 7.2

* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               CentOS 6.x              |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |service gluu-server-2.4.4 start        |
|       Log into Gluu `chroot`  |service gluu-server-2.4.4 login        |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|
|       Gluu Server Status      |service gluu-server-2.4.4 status	|

|       Command Description     |               CentOS 7.2              |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/sbin/gluu-serverd-2.4.4 start         |
|       Log into Gluu `chroot`  |/sbin/gluu-serverd-2.4.4 login         |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|
|       Gluu Server Status      |/sbin/gluu-serverd-2.4.4 status	|

### Uninstall Gluu Server
Gluu Server uninstallation follows the same principle as package removal from CentOS. The server must be stopped to remove the package.

|       Command Description     |               CentOS 6.x              |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |service gluu-server-2.4.4 stop         |
|       Uninstall Gluu Server   |yum remove gluu-server-2.4.4           |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

|       Command Description     |               CentOS 7.2              |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/sbin/gluu-serverd-2.4.4 stop          |
|       Uninstall Gluu Server   |yum remove gluu-server-2.4.4           |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

## Red Hat Enterprise Linux (RHEL)
### RHEL 6.5
The following commands will install Gluu Server `chroot`. The supported versions include 6.6,6.7 and 6.8

|       Command Description     |               RHEL 6.x              |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/centos/Gluu-centos6.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/centos/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Import GPG Key          |rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

### RHEL 7.2
The following commands will install Gluu Server `chroot`


|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |wget https://repo.gluu.org/rhel/Gluu-rhel7.repo -O /etc/yum.repos.d/Gluu.repo|
|       Add Gluu GPG Key        |wget https://repo.gluu.org/rhel/RPM-GPG-KEY-GLUU -O /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Import GPG Key          |rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-GLUU|
|       Update/Clean Repo       |yum clean all                          |
|       Install Gluu Server     |yum install gluu-server-2.4.4          |

### Complete Installation
The setup is completed by running the setup script `setup.py` from the setup folder. The commands are different in RHEL 6.x and RHEL 7

* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               RHEL 6.x                |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |service gluu-server-2.4.4 start        |
|       Log into Gluu `chroot`  |service gluu-server-2.4.4 login        |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|

|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/sbin/gluu-serverd-2.4.4 start         |
|       Log into Gluu `chroot`  |/sbin/gluu-serverd-2.4.4 login         |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|

### Uninstall Gluu Server
Gluu Server uninstallation follows the same principle as package removal from RHEL. The sevrer must be stopped to remove the package.

|       Command Description     |               RHEL 6.x                |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |service gluu-server-2.4.4 stop         |
|       Uninstall Gluu Server   |yum remove gluu-server-2.4.4           |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

|       Command Description     |               RHEL 7                  |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/sbin/gluu-serverd-2.4.4 stop          |
|       Uninstall Gluu Server   |yum remove gluu-server-2.4.4           |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |

## Debian 8 (Jessie)
The following commands will install Gluu Server `chroot`

|       Command Description     |               Jessie Commands         |
|-------------------------------|---------------------------------------|
|       Add Gluu Repository     |echo "deb https://repo.gluu.org/debian/ stable main" > /etc/apt/sources.list.d/gluu-repo.list|
|       Add Gluu GPG Key        |curl https://repo.gluu.org/debian/gluu-apt.key | apt-key add -|
|       Update/Clean Repo       |apt-get update                         |
|       Install Gluu Server     |apt-get install gluu-server-2.4.4      |

### Complete Installation
The setup is completed by running the setup script `setup.py` from the setup folder.
* Log into Gluu Server `chroot`
* Run the setup script

|       Command Description     |               Jessie Commands |
|-------------------------------|---------------------------------------|
|       Start Gluu Server       |/etc/init.d/gluu-server-2.4.4 start    |
|       Log into Gluu `chroot`  |/etc/init.d/gluu-server-2.4.4 login    |
|       Run [Setup Script](./setup_py.md)        |cd /install/community-edition-setup/ <br/>./setup.py|

### Uninstall Gluu Server
Gluu Server uninstallation follows the same principle as package removal from Ubuntu. The server must be stopped to remove the package.

|       Command Description     |               Jessie Commands         |
|-------------------------------|---------------------------------------|
|       Stop Gluu Server        |/etc/init.d/gluu-server-2.4.4 stop     |
|       Uninstall Gluu Server   |apt-get remove gluu-server-2.4.4       |
|       Remove backup folder    |rm -rf /opt/gluu-server-2.4.4*         |


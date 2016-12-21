
# 1 Preparing VM for Gluu Server Installation
Gluu Server Community Edition (CE) resource allocation depends on the backend data size. The requirements below are a bare minimum for Gluu CE to function properly. It is strongly recommended to allocate more resource for bigger backend data size.

|CPU Unit       |       RAM     |       Disk Space      | Processor Type|
|---------------|---------------|-----------------------|-------------------------|
|       2       |       4GB     |       40GB            |		64 Bit       |

!!! warning
    The processor type must be 64 bit for Gluu Server to function
!!! note
    Insufficient memory may cause unexpected errors and bugs which will require adjusting the resources for a smooth performance.

## 1.1 Port
The following ports open for the Gluu Server to run. Please keep the ports open before installing Gluu Server.

|       Port Number     |       Protocol        |
|-----------------------|-----------------------|
|       80              |       tcp             |
|       443             |       tcp             |

## 1.2 Tomcat Memory Heap

The minimum recommended heap for tomcat server is 3GB for a test instance of Gluu Server Community Edition (CE). This estimate is based on the minumum RAM requirements. It is best to keep this ratio when tomcat memory is allocated in production environments as the size will depend on the available RAM; as an example, a 6GB tomcat memory heap in a production server with 8 GB ram is ideal for a small organization running Gluu CE.

### 1.2.1 Alter Tomcat Memory Heap

The tomcat heap memory is set from the `setup.py` script prompt. 
![tomcat-prompt](../img/oxtrust/tomcat-prompt.png)

This property can also altered from the `/opt/tomcat/conf/gluuTomcatWrapper.conf` file inside the Gluu Server chroot container setting `wrapper.java.initmemory` and `wrapper.java.maxmemory` properties.
Use the following command to open the gluuTomcatWrapper file
```
# vi /opt/tomcat/conf/gluuTomcatWrapper.conf
```

Please change the values in following parameters. This example is taken from a CentOS installation of Gluu Server.

```
# Initial Java Heap Size (in MB)
wrapper.java.initmemory=512

# Maximum Java Heap Size (in MB)
wrapper.java.maxmemory=1536
```

## 1.3 File Descriptor
Gluu recommends setting the `file descriptors` to 65k for Gluu Server CE. The following steps will help set the `file descriptor` limit.

* Edit the `/etc/security/limits.conf` file.
* Add the following lines in the `limits.conf` file. Please replace the `username` with the user that will install Gluu Server.

```
* soft nofile 65536
* hard nofile 262144
```

* Edit the `/etc/pam.d/login` by adding the line:
```
session required pam_limits.so
```
* Use the system file limit to increase the file descriptor limit to 65535. The system file limit is set in `/proc/sys/fs/file-max`.
```
echo 65535 > /proc/sys/fs/file-max
```

* Use the `ulimit` command to set the file descriptor limit to the hard limit specified in `/etc/security/limits.conf`.
```
ulimit -n unlimited
```
* Restart your system.

## 1.4 Cloud Specific Instructions

### 1.4.1 Amazon AWS

Amazon AWS provides a public and private IP address to its clouds. While
running the `/install/community-edition-setup/setup.py` script, use the
Private IP address.

### 1.4.2 Microsoft Azure

Accessing the Gluu Server on Azure can be a little bit tricky because of
the Public/Private IP. Azure assigns a new Public/Private IP
addresses each time the server is started. 

#### 1.4.2.1 Setting up VM
1. Log into Windows Azure Administrative Panel

2. Click on `Virtual Machines` tab, and click `Create a Virtual Machine` link

3. From the menu, choose `Compute` --> `Virtual Machine` --> `From Gallery` branch.

4. Choose Ubuntu Server 14.04 LTS or CentOS 6.7. Remember to set selinux
   to permissive if you choose CentOS.

5. Provide a name for the VM in the `Virtual Machine Name` field and use
`Standard` for `Tier`.

6. Select at least `A2` variant equipped with 3.5GB RAM in the `Size`
dropdown menu.

7. Provide an username to connect via ssh, and define an according
   access password, or upload a certificate for an authentification
   without passwords. Then, click `Next`.

8. Create a new cloud service and select `None` for `Availability Set`
   option.
        * Endpoints Section: This is where the port forwarding is set so
      that the internal IP address could be selectively reachable from
      the outside world. By default, only ssh tcp port 22 is there. The
      public ports for http and https (tcp ports 80 and 443) have to be
      added and mapped to the same private ports. If the cloud mappings
      are flagged conflicting, proceed without setting them. Remember to
      set them after the creation of the VM. Then, click `Next`.

9. Choose not to install `VM Agent` and click the `tick` button to
   finalize the VM.

10. Go to the `Dashboard` tab of VM Management Panel and copy the `DNS
    Name`. This is the name that is used to access the Gluu Server.

11. SSH into the VM and install the Gluu Server. See our [Installation Guide](./install.md) for
    installation instructions.

#### 1.4.2.2 Setup.py Configuration
This section describes what to put in the prompt when `setup.py` is run
after installing Gluu Server.

* IP Address: Do not change the default IP address; just press `enter`.

* hostname: Use the DNS name that was copied from the `VM Management Panel.

* Update hostname: Choose to update hostname for Ubuntu, but do not
  change if you are running CentOS.
        * For CentOS, manually update the file `/etc/sysconfig/networking`, and add the full DNS name.

* Now the chosen DNS name can be used to access the Gluu Server.

### 1.4.3 Linode VM

The Linode Virtual Machines (VM) use a custom kernel which is not supported by Gluu Server, therefore the kernel must be updated before Gluu Server can be installed in Linode VM. The following steps will guide you through kernel update in the Linode VM.

* Check for the current version of the kernel. If the output contains `-Linode`, then proceed
```
# uname -a
```

* Run the following command to update the kernel
```
# apt-get install linux-image-virtual grub2
```

* Modify `grub` file in the `/etc/default/` folder
```
# vim /etc/default/grub
```

  * Ensure that the following lines are present in the grub file
```
GRUB_TIMEOUT=10
GRUB_CMDLINE_LINUX="console=ttyS0,19200n8"
GRUB_DISABLE_LINUX_UUID=true
GRUB_SERIAL_COMMAND="serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1"
```

* Finally run the following commands to update `grub` and reboot
```
# update-grub
# reboot
```



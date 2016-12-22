[TOC]
# Configure Log Viewer

The Gluu Server has the facility to read log files using the GUI. The
log file can be displayed from the Web UI with a few clicks of the
mouse. This feature can be enabled from the configuration menu clicking
**Configuration --> Configure Log Viewer**.

![Configure Log Viewer](/img/oxtrust/Conf_log_viewer_Menu.png)

Gluu Server comes preloaded with four logs in this page as the screenshot portrays. The oxAuth, oxTrust, Cache Refresh and the console log is available by default.
Clicking on **Add log template** will bring up boxes where log path can be set to view the same from the GUI. The boxes on the
left contain the name/description of the log file, and the right boxes
contain the path of the log file such as _/opt/tomcat/logs/demo.log_.

# View Log File

The log files configured in the earlier section can be viewed using the
**View log file** feature. This feature can be accessed through the
configuration menu using **Configuration --> View Log File**.

![View Log File](/img/oxtrust/admin_view_log.png

The **Display last lines count** field contains the lines that will be
displayed in the Web GUI. If the field contains the value **400**, then
the Gluu Server will show the last 400 lines of the log in the GUI. The
screenshot below shows an according example.

![Log file tail](/img/oxtrust/admin_view_logtail.png)


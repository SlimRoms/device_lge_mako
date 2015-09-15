#!/system/bin/sh
#
# Check if user has Slim kernel installed.
# If so disable stock mpdecision and thermal service
# If user uses a 3rd party kernel exit and lets kernel do it's thing

log_file="/data/kernel-boot.log"

echo "----------------------------------------------------" >$log_file
echo "SlimMako Kernel - execution of kernel options init script" >>$log_file
echo "----------------------------------------------------" >>$log_file
echo "Kernel version : `uname -a`" >>$log_file

echo `date +"%F %R:%S : Checking for SlimMako kernel..."` >>$log_file

if [ "`uname -r | grep SlimMako`" == "" ]
  then
    echo `date +"%F %R:%S : No SlimMako kernel found, skip executing the config file"` >>$log_file
    exit
fi;

echo `date +"%F %R:%S : SlimMako kernel found, continue executing the config file..."` >>$log_file

echo `date +"%F %R:%S : Waiting for Android to start..."` >>$log_file

# Wait until we see some android processes to consider boot is more or less complete (credits to AndiP71)
while ! pgrep com.android ; do
  sleep 1
done

echo `date +"%F %R:%S : Android is starting up, let's wait another 10 seconds..."` >>$log_file

# Now that is checked, let's just wait another tiny little bit
sleep 30

echo `date +"%F %R:%S : Starting kernel configuration..."` >>$log_file

# Set SlimMako kernel hotplug defaults
stop mpdecision
echo `date +"%F %R:%S : Check if mpdecision service is running..."` >>$log_file
ps | grep mpdecision >>$log_file
echo 1 > /sys/kernel/msm_mpdecision/conf/enabled

# Set SlimMako kernel thermal defaults
stop thermald
echo `date +"%F %R:%S : Check if thermald service is running..."` >>$log_file
ps | grep thermald >>$log_file
echo 1 > /sys/module/msm_thermal/parameters/enabled

echo `date +"%F %R:%S : Dumping demesg..."` >>$log_file
echo "----------------------------------------------------" >>$log_file
dmesg >>$log_file
echo "----------------------------------------------------" >>$log_file
echo `date +"%F %R:%S : End of demesg..."` >>$log_file

echo `date +"%F %R:%S : End of script"` >>$log_file
chmod 644 $log_file

#!/bin/bash
# created by John Hartman , john.hartman@ibm.com or john.michael.hartman@gmail.com

d=`date +%Y-%m-%d`

dir=/store/LOGS/QRadar_Patching_$d

echo "Working on the pre-patching script"


#removes old deployment_info outputs
rm -rf /store/LOGS/qradar_deploymet_info*

echo "Removing the junk you forgot to clean up"

#Create directory for patching documents
mkdir $dir

# Verify you have enough space in the QRadar console
/opt/qradar/support/all_servers.sh -C "df -h" > $dir/diskcheck.txt

# health check
/opt/qradar/support/all_servers.sh -C "drq" > $dir/drq_output.txt

# Get a list of all the managed hosts
/opt/qradar/support/deployment_info.sh 
mv /store/LOGS/qradar_deployment_info* $dir

# Confirm all appliances are at the same version
/opt/qradar/support/all_servers.sh -C "/opt/qradar/bin/myver" > $dir/myver_output.txt

/opt/qradar/support/all_servers.sh -C "mkdir -p /media/updates" > /dev/null

echo "$dir created with all of your files, have a wonderful day ya filthy animals"

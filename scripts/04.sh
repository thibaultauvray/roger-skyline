if ! [ -e "/home/vagrant/crontab.sum"  ];
then
	sudo cat /etc/crontab > /home/vagrant/crontab.sum
	printf "Copie of crontab make\n"
elif ! [ -e "/etc/crontab" ]
then
	printf "%s doesn't exist\n" "$2"
	exit 2
fi

# Get checksums of eithe file
file1_md5=$( md5sum "/home/vagrant/crontab.sum" | awk '{print $1}')
file2_md5=$( md5sum "/etc/crontab" | awk '{print $1}')

# Compare the checksums
if [ "x$file1_md5" = "x$file2_md5" ]
then
	printf "No modification \n"
	exit 0
else
	printf "Modification detected, mail send\n"
	echo "Crontab have changed" | mail -s "Crontab have changed" root
	sudo cat /etc/crontab > /home/vagrant/crontab.sum
	exit 1
fi

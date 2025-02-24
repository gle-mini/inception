if [ ! -f "/etc/vsftpd.userlist" ]; then

	mkdir -p /var/run/vsftpd/empty
	mkdir -p /home/${MYSQL_USER}

	mv /var/www/vsftpd.conf /etc/vsftpd.conf

	useradd -m -s /bin/bash $FTP_USER
	echo $FTP_USER > /etc/vsftpd.userlist
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USER:$FTP_USER /home/${MYSQL_USER}

fi

/usr/sbin/vsftpd /etc/vsftpd.conf

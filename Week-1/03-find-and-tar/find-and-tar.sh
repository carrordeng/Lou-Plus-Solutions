sudo find /etc -size +12k -type f -exec cp -r --parents {} backup \;
sudo tar -czvf /tmp/backup.tar.gz backup

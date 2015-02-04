# Backup Wordpress Files
tar -jcvf ./wordpress_backup_$(date +%y%m%d).tbz2 /var/www/*

# Backup Wordpress Database
mysqldump --opt -u root -p<password> wordpress > wordpress_backup_$(date +%y%m%d).sql

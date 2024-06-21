#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="backups"
MYSQL_USER="root"
MYSQL_PASSWORD="root"
MYSQL_DATABASE="your_database_name"

mkdir -p ${BACKUP_DIR}
mysqldump --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} > ${BACKUP_DIR}/${MYSQL_DATABASE}_${TIMESTAMP}.sql
git add ${BACKUP_DIR}
git commit -m "Database backup on ${TIMESTAMP}"
git push

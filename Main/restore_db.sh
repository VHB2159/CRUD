#!/bin/bash
BACKUP_DIR="backups"
MYSQL_USER="root"
MYSQL_PASSWORD="root"
MYSQL_DATABASE="your_database_name"
LATEST_BACKUP=$(ls -t ${BACKUP_DIR}/*.sql | head -n 1)

if [ -f ${LATEST_BACKUP} ]; then
  mysql --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ${LATEST_BACKUP}
  echo "Database restored from ${LATEST_BACKUP}"
else
  echo "No backup file found"
fi

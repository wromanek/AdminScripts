#!/bin/bash

# $1 username
username=$1
# $2 password
pass=$2
# $3 database
db=$3
# $4 source table prefix
sourcePrefix=$4
# $5 target table prefix
targetPrefix=$5

mysql -u "$username" --password="$pass" -D "$db" -e "show tables" -s | 
 	egrep "^$targetPrefix" | 
 	xargs -I "@@" mysql -u "$username" --password="$pass" -D "$db" -e "DROP TABLE @@"

mysql -u "$username" --password="$pass" -D "$db" -e "show tables" -s |
        egrep "^$sourcePrefix" |
        xargs -I "@@" echo "@@" | sed "s/"$sourcePrefix"/""/g" | 
	xargs -I "@@" mysql -u "$username" --password="$pass" -D "$db" -e "CREATE TABLE $targetPrefix@@ LIKE $sourcePrefix@@;INSERT $targetPrefix@@ SELECT * FROM $sourcePrefix@@;"

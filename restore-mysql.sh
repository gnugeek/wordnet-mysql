#!/bin/bash
# bbou@ac-toulouse;fr
# 2007-02-22 17:00

db='wordnet30'
dbtype=mysql
dbuser=root

echo "* restoring ${db}"
if [ -z "$1" ]; then
	read -s -p "enter ${dbuser}'s password: " MYSQLPASSWORD
	echo
	export MYSQLPASSWORD
else
	MYSQLPASSWORD=$1
	shift
fi

echo "create ${db}"
mysql -u ${dbuser} --password=$MYSQLPASSWORD < ${dbtype}-${db}-createdb.sql
echo "schema"
mysql -u ${dbuser} --password=$MYSQLPASSWORD < ${dbtype}-${db}-schema.sql ${db}
echo "data"
mysql -u ${dbuser} --password=$MYSQLPASSWORD < ${dbtype}-${db}-data.sql ${db}
echo "constraints"
mysql -u ${dbuser} --password=$MYSQLPASSWORD --force < ${dbtype}-${db}-constraints.sql ${db}

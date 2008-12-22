@echo off

echo "create wordnet30"
mysql -u root -p < mysql-wordnet30-createdb.sql
echo "schema"
mysql -u root -p < mysql-wordnet30-schema.sql wordnet30
echo "data"
mysql -u root -p < mysql-wordnet30-data.sql wordnet30
echo "constraints"
mysql -u root -p --force < mysql-wordnet30-constraints.sql wordnet30

#!/bin/bash

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz

gunzip -k web-server-access-log.txt.gz

cut -d"#" -f1,2,3,4 web-server-access-log.txt > extract.txt

tr "#" "," < extract.txt > transformed.csv

echo "\c template1;\COPY access_log  FROM '/home/project/transformed.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost

# To test the script, run
# echo '\c template1; \\SELECT * from access_log;' | psql --username=postgres --host=localhost
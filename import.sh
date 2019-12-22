#!/bin/bash
touch insert-new.sql
rm insert-new.sql
cp insert-new-template.sql insert-new.sql
sed -i 's:csv-filepath:'$5':g' insert-new.sql
mysql -u root -p$3 -h $1 -P $2 $4 -e "source insert-new.sql;"

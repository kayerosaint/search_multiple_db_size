## Simple script for check multiple database size in POSTGRESPRO!
## Just print for example "bash search.sh db1 db2 db3" ...etc

#!/bin/bash
dir=$(pwd)
echo "" > $dir/dbsizes.md
list="$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21 $22 $23 $24 $25 $26 $27 $28 $29 $30"
for string_name in $list ; do
  sudo -u postgres /opt/pgpro/1c-10/bin/psql -c "SELECT pg_database_size('$string_name') / 1024 /1024 || 'MB';" >&/dev/null >> $dir/dbsizes.md && echo "$string_name" >> $dir/dbsizes.md
      done
cat $dir/dbsizes.md | grep -Eo '[0-9]{2,9}' > $dir/tmp.md && echo "all_raws_summ" >> $dir/dbsizes.md && awk '{ sum += $1 } END { print sum "MB"}' $dir/tmp.md >> $dir/dbsizes.md && rm -rf $dir/tmp.md


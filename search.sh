## Simple script for check multiple database size in POSTGRESPRO!
## Just print for example "bash search.sh db1 db2 db3" ...etc

#!/bin/bash
dir=$(pwd)
echo "" > $dir/dbsizes.md
num_args=$#

for i in $(seq 1 $num_args); do
  db_name=$(echo "$@" | cut -d' ' -f$i)
  sudo -u postgres /opt/pgpro/1c-10/bin/psql -c "SELECT pg_database_size('$db_name') / 1024 /1024 || 'MB';" >&/dev/null >> $dir/dbsizes.md && echo "$db_name" >> $dir/dbsizes.md
done

cat $dir/dbsizes.md | grep -Eo '[0-9]{2,9}' > $dir/tmp.md && echo "all_raws_summ" >> $dir/dbsizes.md && awk '{ sum += $1 } END { print sum "MB"}' $dir/tmp.md >> $dir/dbsizes.md && rm -rf $dir/tmp.md


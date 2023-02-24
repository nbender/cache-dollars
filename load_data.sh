set -e

psql -f create_stage_tables.sql

for f in ~/git/pystock-data/????/????????.tar.gz; do
  d=`basename $f .tar.gz`

  echo "tar xvfzO $f prices.csv"
  tar xvfzO $f prices.csv | psql -c "copy stage_prices (symbol, date, open, high, low, close, volume, adj_close) from stdin with (format csv, header)"
  echo "tar xvfzO $f symbols.txt"
  tar xvfzO $f symbols.txt | psql -c "copy stage_symbols (symbol, name) from stdin with (format text)"

  echo "update load information"
  psql -c "update stage_prices set update = true where file_date is null and date != (select max(date) from stage_prices where file_date is null)"
  psql -c "update stage_prices set update = false where file_date is null and update is null"
  psql -c "update stage_prices set file_date='$d' where file_date is null"
  psql -c "update stage_symbols set file_date='$d' where file_date is null"
done

psql -f conversions.sql
psql -f create_prices.sql

set -e

psql -f create_stage_tables.sql

for f in ~/git/pystock-data/????/????????.tar.gz; do
  d=`basename $f .tar.gz`

  echo "tar xvfzO $f prices.csv"
  echo '{ printf "%s,%s\\n", $0, "'$d'"; }' > ap.awk
  tar xvfzO $f prices.csv | tr -d '\r' | awk -f ap.awk |
      psql -c "copy stage_prices (symbol, date, open, high, low, close, volume, adj_close, file_date) from stdin with (format csv, header)"

  echo "tar xvfzO $f symbols.txt"
  echo '{ printf "%s\t%s\\n", $0, "'$d'"; }' > ap.awk
  tar xvfzO $f symbols.txt | tr -d '\r' | awk -f ap.awk | \
      psql -c "copy stage_symbols (symbol, name, file_date) from stdin with (format text)"
done

psql -f conversions.sql
psql -f create_prices.sql

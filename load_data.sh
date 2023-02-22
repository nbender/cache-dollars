echo ~/git/pystock-data/2015/20150324.tar.gz
tar xvfzO ~/git/pystock-data/2015/20150324.tar.gz prices.csv | psql -c "copy stage_prices from stdin with (format csv, header)"
tar xvfzO ~/git/pystock-data/2015/20150324.tar.gz symbols.txt | psql -c "copy stage_symbols (symbol, name) from stdin with (format text); update stage_symbols set date='20150324' where date is null"


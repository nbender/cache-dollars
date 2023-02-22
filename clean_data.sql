drop table if exists prices;
select date, symbol
     , max(open) as open
     , max(high) as high
     , min(low) as low
     , max(close) as close
     , max(volume) as volume
     , max(adj_close) as adj_close
into prices
from stage_prices
group by date, symbol;

drop table if exists symbols;
select date, symbol, max(name) as name
into symbols
from stage_symbols
group by date, symbol;

-- drop table if exists stage_prices;
-- drop table if exists stage_symbols;

select table_name
     , pg_size_pretty(pg_relation_size(quote_ident(table_name)))
     , pg_relation_size(quote_ident(table_name))
from information_schema.tables
where table_schema = 'public'
order by 3 desc;

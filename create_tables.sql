drop table if exists stage_prices;
create table stage_prices (symbol varchar(100), date date, open decimal, high decimal, low decimal, close decimal, volume integer, adj_close decimal);

drop table if exists stage_symbols;
create table stage_symbols (symbol varchar(100), name varchar(100), date date);

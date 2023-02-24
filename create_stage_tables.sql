drop table if exists stage_prices;

create table stage_prices (symbol varchar(100), date varchar(100), file_date date
                         , open varchar(100), high varchar(100), low varchar(100), close varchar(100)
                         , volume varchar(100), adj_close varchar(100), update boolean);
create index stage_prices_by__symbol__date on stage_prices (symbol, date);
create index stage_prices_by__null_file_date on stage_prices(file_date) where file_date is null;

drop table if exists stage_symbols;
create table stage_symbols (symbol varchar(100), name varchar(100), file_date date);
create index stage_symbols_by__symbol__file_date on stage_prices (symbol, file_date);
create index stage_symbols_by__null_file_date on stage_symbols(file_date) where file_date is null;

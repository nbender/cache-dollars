drop table if exists prices;

with staged as (
     select convert_to_date(date) as date, symbol, open, high, low, close, volume, file_date
     from stage_prices where update = false
)
select *
into prices
from staged
where date is not null;

create index prices_by__date__symbol on prices (date, symbol);
create index prices_by__symbol__date on prices (symbol, date);

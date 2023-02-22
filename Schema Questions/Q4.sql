/*Q Which ciry has the best customers?
waq that returns one city that has highest sum of invoice totals
return both city name and sum of all invoice totals
*/ 

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
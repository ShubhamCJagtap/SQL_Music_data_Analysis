/* Q1 WAQ to return the email, first_name_lat_name and Genre of all Rock Music listners,
Return list ordered alphabetically by email starting with A
*/

select DISTINCT email,first_name, last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id IN(
	
select track_id from track
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock')
ORDER BY email;
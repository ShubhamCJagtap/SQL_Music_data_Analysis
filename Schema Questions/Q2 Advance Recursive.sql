
WITH RECURSIVE
	sales_per_country AS(
	SELECT COUNT(*) AS purchase_per_genre, customer.country AS country,genre.name, genre.genre_id
		FROM invoice_line
		JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
		Join customer ON customer.customer_id = invoice.customer_id
		JOIN track ON track.track_id = invoice_line.track_id
		JOIN genre ON genre.genre_id = track.genre_id
		GROUP BY 2,3,4
		ORDER BY 2
	),
	max_genre_per_country AS (SELECT MAX(purchase_per_genre) AS max_genre_number, country
							 FROM sales_per_country
							  GROUP BY 2
							  ORDER BY 2
							 )
SELECT sales_per_country.*
FROM sales_per_country
JOIN max_genre_per_country ON sales_per_country.country = max_genre_per_country.country
WHERE sales_per_country.purchase_per_genre = max_genre_per_country.max_genre_number
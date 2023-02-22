/* Q2 write a query that returns the artist name and total  track count of the top 10 rock bands*/

select artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
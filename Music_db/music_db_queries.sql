-- 1. What are tracks for a given album?
SELECT
    track.name
FROM
    track
LEFT OUTER JOIN
    album on album.id = track.album_id
WHERE
    album.name = 'A Very Merry Christmas';


-- 2. What are the albums produced by a given artist?
SELECT
    album.name as albums_by_james
FROM
    album
LEFT OUTER JOIN
	artist on artist.id = album.artist_id
WHERE
	artist.name = 'James';


-- 3. What is the track with the longest duration?
SELECT
    track.name,
    track.length
FROM
	track
ORDER BY
	track.length desc
LIMIT 1;


-- 4. What are the albums released in the 60s? 70s? 80s? 90s?
SELECT
    album.name
FROM
	album
WHERE
    album.year >= 1990 and album.year <= 1999;


-- 5. How many albums did a given artist produce in the 90s?
SELECT
    count(album.name)
FROM
	album
LEFT OUTER JOIN
	artist on artist.id = album.artist_id
WHERE
    album.year >= 1990 and album.year <= 1999 and artist.name = 'James';


-- 6. What is each artist's latest album?
SELECT
    artist.name,
    max(album.year)
FROM
    album,
    artist
WHERE
    album.artist_id = artist.id
GROUP BY
	artist.id;


-- 7. List all albums along with its total duration based on summing the duration of its tracks.
SELECT
	album.name,
	sum(track.length)
FROM
	track,
	album
WHERE
	track.album_id = album.id
GROUP BY
	album.id;


-- 8. What is the album with the longest duration?
SELECT
    *
FROM
    (SELECT
    	album.name,
    	sum(track.length)
    FROM
    	track,
    	album
    WHERE
    	track.album_id = album.id
    GROUP BY
    	album.id) album_lengths
ORDER BY
    sum desc
LIMIT 1;

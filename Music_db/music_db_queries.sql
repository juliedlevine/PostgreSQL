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


-- 7. What is the title of each artist's latest album
SELECT
    distinct on (artist.id)
    artist.name,
    album.name,
    album.year
FROM
    album,
    artist
WHERE
    album.artist_id = artist.id
ORDER BY
	artist.id,
	year desc;

-- 8. List all albums along with its total duration based on summing the duration of its tracks.
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


-- 9. What is the album with the longest duration?
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


-- 10. Who are the 5 most prolific artists based on the number of albums they have recorded?
-- Top 5 artists based on number of albums
SELECT
    artist.name,
    count(album.name)
FROM
    artist
LEFT OUTER JOIN
    album on artist.id = album.artist_id
GROUP BY
    artist.id
ORDER BY
    count desc
LIMIT
    5;


-- 11. What are all the tracks a given artist has recorded?
SELECT
    artist.name,
    track.name
FROM
	track,
	album,
	artist
WHERE
	track.album_id = album.id
	and album.artist_id = artist.id
	and artist.name = 'Belle & Sebastian';


-- 12. What are the top 5 most often recorded songs?
SELECT
    song.name as song_name,
    count(song.id)
FROM
    song,
    track
WHERE
	track.song_id = song.id
GROUP BY
	song.id
LIMIT
	5;


-- 13. Who are the top 5 song writers whose songs have been most often recorded?
SELECT
	song_writer.name as song_writer,
	count(track.name) as track_name
FROM
	song_writer
LEFT OUTER JOIN
	song on song.song_writer_id = song_writer.id
LEFT OUTER JOIN
	track on track.song_id = song.id
GROUP BY
	song_writer.id
LIMIT
	5;


-- 14. Who is the most prolific song writer based on the number of songs he has written?
SELECT
	song_writer.name as song_writer,
	count(song.name) as song_count
FROM
	song_writer
LEFT OUTER JOIN
	song on song.song_writer_id = song_writer.id
GROUP BY
	song_writer
ORDER BY
	song_count desc
LIMIT
	1;


-- 15. What songs has a given artist recorded?
SELECT
    distinct on (song.name)
    artist.name as artist,
    song.name
FROM
    artist
LEFT OUTER JOIN
    album on album.artist_id = artist.id
LEFT OUTER JOIN
    track on track.album_id = album.id
LEFT OUTER JOIN
    song on track.song_id = song.id
WHERE
	artist.name = 'Julie';


-- 16. Who are the song writers whose songs a given artist has recorded?
SELECT
	song_writer.name as song_writer,
	song.name as song_name,
	artist.name as artist_name
FROM
    artist,
    album,
    track,
    song,
    song_writer
WHERE
    album.artist_id = artist.id
    and track.album_id = album.id
    and track.song_id = song.id
	and song.song_writer_id = song_writer.id
	and artist.name = 'Belle & Sebastian';


-- 17. Who are the artists who have recorded a given song writer's songs?
SELECT
	distinct on (artist.name)
	song_writer.name as song_writer,
	song.name as song_name,
	artist.name as artist_name
FROM
    artist,
    album,
    track,
    song,
    song_writer
WHERE
    album.artist_id = artist.id
    and track.album_id = album.id
    and track.song_id = song.id
	and song.song_writer_id = song_writer.id
	and song_writer.name = 'Giorgio';



-- Bonus Challenge 1
-- Given a lead artist, what collaborators has he worked with?
SELECT
	artist.name as Julie_collab_with
FROM
	(SELECT
	    artist.name as lead_artist,
	    album.name as album,
	    collaborators.collaborator_id
	FROM
	    artist
	LEFT OUTER JOIN
		album on album.artist_id = artist.id
	LEFT OUTER JOIN
	    collaborators on collaborators.album_id = album.id
	WHERE
		artist.name = 'Julie') collab,
	artist
WHERE
	artist.id = collab.collaborator_id;


-- Super challenge: given an artist who has worked as a collaborator, who are the other collaborators he has worked with?
SELECT
    artist.name as lead_artist,
    album.name as album,
    collaborators.album_id,
    collaborators.collaborator_id
FROM
    artist
LEFT OUTER JOIN
	album on album.artist_id = artist.id
LEFT OUTER JOIN
    collaborators on collaborators.album_id = album.id
LEFT OUTER JOIN
   artist on artist.id = collab.collaborator_id;

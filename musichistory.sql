-- Query all of the entries in the Genre table
SELECT *
FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished )
VALUES ("The Heavy", 2007);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, "Label", ArtistId, GenreId)
VALUES ("The House That Dirt Built", 2009, 2280, "Counter", 28, 2);

-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("How You Like Me Now", 217, "08/01/2009", 2, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ("Short Change Hero", 322, "10/13/2009", 2, 28, 23);

-- Using the INSERT statement, add some songs that are on that album to the Song table.

SELECT s.Title, a.Title, ar.ArtistName 
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId 
WHERE ar.ArtistName = 'The Heavy';

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.Title, COUNT(s.SongId) AS "Total Songs per Album"
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT ar.ArtistName, COUNT(s.SongId) AS "Song Count"
From Song s
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
GROUP BY s.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT(s.SongId) AS "Song Count"
FROM Song s
LEFT JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT Title, MAX(AlbumLength)
FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT Title, MAX(SongLength)
FROM Song;

-- Modify the previous query to also display the title of the album.

SELECT s.Title, MAX(s.SongLength), al.Title
from Song s
LEFT JOIN Album al ON s.AlbumId = al.AlbumId;

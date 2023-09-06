-- to make sure you're creating the procedure in the appropriate database.
USE Movies -- one problem with the USE statement and the CREATE PROC statement,
-- the CREATE PROC statement must be the first statement in a batch. to solve this,
GO -- GO statement which begins a new batch statement

CREATE PROC spFilmList -- ALL WE NEED TO DO!
AS -- will convert the select statement below into a stored procedure
-- when we execute this code
BEGIN -- BEGIN and END block to contain all of the statements
-- that belong to your stored procedure
-- it's not necessary in this case, we only have one SELECT statement.
     SELECT 
          FilmName
          ,FilmReleaseDate
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     ORDER BY
          FilmName ASC
END

--

ALTER PROC spFilmList --
AS
BEGIN
     SELECT 
          FilmName
          ,FilmReleaseDate
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     ORDER BY
          FilmName DESC --
END

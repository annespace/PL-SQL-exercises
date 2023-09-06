-- the stored procedure which accepts a single parameter 
USE Movies
GO

CREATE PROC spFilmCriteria(@MinLength AS INT) 
-- parameter names must begin with an @ symbol, 
-- also I have to specify data type that the parameter will be allowed
AS
BEGIN
     SELECT
          FilmName
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     ORDER BY
          FilmRunTimeMinutes ASC   
END

-- 

USE Movies
GO

CREATE PROC spFilmCriteria(@MinLength AS INT) 
AS
BEGIN
     SELECT
          FilmName
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     WHERE
          FilmRunTimeMinutes >= @MinLength
     ORDER BY
          FilmRunTimeMinutes ASC   
END

--

USE [Movies]
GO

ALTER PROC [dbo].[spFilmCriteria]
     (
          @MinLength AS INT
          ,@MaxLength AS INT --
     ) 
-- red underlining? Edit > IntelliSense > Refresh Local Cache
AS
BEGIN
     SELECT
          FilmName
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     WHERE
          FilmRunTimeMinutes >= @MinLength AND
          FilmRunTimeMinutes <= @MaxLength --
     ORDER BY
          FilmRunTimeMinutes ASC   
END

--

USE [Movies]
GO

ALTER PROC [dbo].[spFilmCriteria]
     (
          @MinLength AS INT
          ,@MaxLength AS INT 
          ,@Title AS VARCHAR(MAX) --
     ) 

AS
BEGIN
     SELECT
          FilmName
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     WHERE
          FilmRunTimeMinutes >= @MinLength AND
          FilmRunTimeMinutes <= @MaxLength AND
          FilmName LIKE '%' + @Title + '%'
     ORDER BY
          FilmRunTimeMinutes ASC   
END 

-- EXEC spFilmCriteria @MinLength=120, @MaxLength=180, @Title='star'

--

ALTER PROC [dbo].[spFilmCriteria]
     (
          @MinLength AS INT = 0 --
          ,@MaxLength AS INT 
          ,@Title AS VARCHAR(MAX)
     ) 

--

USE [Movies]
GO

ALTER PROC [dbo].[spFilmCriteria]
     (
          @MinLength AS INT = NULL --
          ,@MaxLength AS INT = NULL --
          ,@Title AS VARCHAR(MAX)
     ) 

AS
BEGIN
     SELECT
          FilmName
          ,FilmRunTimeMinutes
     FROM
          tblFilm
     WHERE
          (@MinLength IS NULL OR FilmRunTimeMinutes >= @MinLength) AND --
          (@MaxLength IS NULL OR FilmRunTimeMinutes <= @MaxLength) AND --
          FilmName LIKE '%' + @Title + '%'
     ORDER BY
          FilmRunTimeMinutes ASC   
END

-- EXEC spFilmCriteria @Title='star'
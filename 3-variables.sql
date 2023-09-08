USE Movies
GO

-- Declaring
DECLARE @MyDate AS DATETIME 
-- all variable names in sql server begin with @, AS is optional, datatype

-- Assigning
SET @MyDate = '1970-01-01'

SELECT 
     FilmName AS [Name]
     ,FilmReleaseDate AS [Date]
     ,'Film' AS [TYPE]
FROM 
     tblFilm
WHERE 
     FilmReleaseDate >= @MyDate --

UNION ALL

SELECT 
     ActorName
     ,ActorDOB
     ,'Actor'
FROM
     tblActor
WHERE
     ActorDOB >= @MyDate --

UNION ALL

SELECT
     DirectorName
     ,DirectorDOB
     ,'Director'
FROM
     tblDirector
WHERE
     DirectorDOB >= @MyDate --
ORDER BY [Date] ASC

--

USE Movies
GO

DECLARE @MyDate AS DATETIME
DECLARE @NumFilms INT --
DECLARE @NumActors INT --
DECLARE @NumDirectors INT --

SET @MyDate = '1970-01-01'
SET @NumFilms = 
     (SELECT COUNT(*) FROM tblFilm WHERE FilmReleaseDate >= @MyDate)
SET @NumActors =
     (SELECT COUNT(*) FROM tblActor WHERE ActorDOB >= @MyDate)
SET @NumDirectors = 
     (SELECT COUNT(*) FROM tblDirector WHERE DirectorDOB >= @MyDate)

-- I can select the results of my variables into the result panel. 
SELECT 'Number of films', @NumFilms --

SELECT 
     FilmName AS [Name]
     ,FilmReleaseDate AS [Date]
     ,'Film' AS [TYPE]
FROM 
     tblFilm
WHERE 
     FilmReleaseDate >= @MyDate

UNION ALL

SELECT 
     ActorName
     ,ActorDOB
     ,'Actor'
FROM
     tblActor
WHERE
     ActorDOB >= @MyDate

UNION ALL

SELECT
     DirectorName
     ,DirectorDOB
     ,'Director'
FROM
     tblDirector
WHERE
     DirectorDOB >= @MyDate
ORDER BY [Date] ASC

--

PRINT 'Number of films = ' + CAST(@NumFilms AS VARCHAR(MAX)) -- CAST!
PRINT 'Number of actors = ' + CAST(@NumActors AS VARCHAR(MAX)) -- CAST!
PRINT 'Number of directors = ' + CAST(@NumDirectors AS VARCHAR(MAX)) -- CAST!

--

USE Movies
GO

DECLARE @ID INT
DECLARE @Name VARCHAR(MAX)
DECLARE @Date DATETIME

-- To assign values to each of these variables
SELECT TOP 1
     @ID = ActorID
     ,@Name = ActorName
     ,@Date = ActorDOB
FROM
     tblActor
WHERE
     ActorDOB >= '1970-01-01'
ORDER BY
     ActorDOB ASC
SELECT
     @Name 
     ,@Date
SELECT 
     f.FilmName
     ,c.CastCharacterName
FROM
     tblFilm AS f
     INNER JOIN tblCast AS c ON f.FilmID = c.CastFilmID
WHERE
     c.CastActorID = @ID

--

USE Movies
GO

DECLARE @NameList VARCHAR(MAX)
SET @NameList = '' -- the variable has some sort of value already that is not NULL.

SELECT
     @NameList = @NameList + ActorName + CHAR(10)
     -- Char(10); New Line / Line Break. Char(13); Carriage Return.
FROM
     tblActor
WHERE
     YEAR(ActorDOB) = 1970

PRINT 
     @NameList

--

SELECT @@SERVERNAME -- shows me the name of the server that I'm currently working on

SELECT @@VERSION

SELECT * FROM tblActor
SELECT @@ROWCOUNT -- shows me the number of Records affected by the last statement

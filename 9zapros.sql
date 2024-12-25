use univers;
/*1*/
DECLARE @A CHAR = 'FDV',
@B VARCHAR = 'SKDL',
@C DATETIME ,
@D TIME,
@E INT,
@F SMALLINT,
@G TINYINT,  
@H NUMERIC(12, 5);


SET @C = '2024-12-12 12:32:12';
SET @D = '12:32:12';
SET @E = 12345;
SELECT @F = 32000,
 @G = 255,
 @H = 12345.67890

 SELECT @A AS CHAR, @B AS VARCHAR, @C AS DATETIME, @D AS TIME;

PRINT 'INT VALUE = ' + CAST(@E as VARCHAR(10));
PRINT 'SMALLINT VALUE = ' + CAST(@F as VARCHAR(10));
PRINT 'TINYINT VALUE = ' + CAST(@G as VARCHAR(10));


/*2*/
DECLARE @TABLE TABLE (AUDITORIUM_CAPACITY INT);

INSERT @TABLE VALUES (240), (300), (200), (180), (150), (175), (230);

DECLARE @TotalCapacity INT;
DECLARE @AverageCapacity DECIMAL(10,2);
DECLARE @CountAuditoriums INT;
DECLARE @CountBelowAverage INT;
DECLARE @PercentBelowAverage DECIMAL(5,2);

SELECT @TotalCapacity = SUM(AUDITORIUM_CAPACITY), 
	@CountAuditoriums = COUNT(*) FROM @TABLE;

IF @TotalCapacity > 200
BEGIN

    SELECT @AverageCapacity = AVG(AUDITORIUM_CAPACITY) FROM @TABLE;

    SELECT @CountBelowAverage = COUNT(*) FROM @TABLE WHERE AUDITORIUM_CAPACITY < @AverageCapacity;

    SET @PercentBelowAverage = (@CountBelowAverage * 100) / @CountAuditoriums;

    PRINT 'Количество аудиторий: ' + CAST(@CountAuditoriums AS VARCHAR);
    PRINT 'Средняя вместимость: ' + CAST(@AverageCapacity AS VARCHAR);
    PRINT 'Количество аудиторий, вместимость которых меньше средней: ' + CAST(@CountBelowAverage AS VARCHAR);
    PRINT 'Процент таких аудиторий: ' + CAST(@PercentBelowAverage AS VARCHAR(5)) + '%';
END
ELSE
BEGIN
    PRINT 'Общая вместимость аудиторий: ' + CAST(@TotalCapacity AS VARCHAR);
END



/*3*/
SELECT 
	@@ROWCOUNT AS Row_Count,             
	@@VERSION AS SQLVersion, 
	@@SPID AS SPID, 
	@@ERROR AS ERROR, 
	@@SERVERNAME AS ServerName,
	@@TRANCOUNT AS TranCount,
	@@FETCH_STATUS AS FetchStatus,
	@@NESTLEVEL AS NESTLEVEL;

--@@ROWCOUNT (число обработан-ных строк); 
--@@VERSION (версия SQL Server);
--@@SPID (возвращает системный идентификатор процесса, назначен-ный сервером текущему подключе-нию); 
--@@ERROR (код последней ошибки); 
--@@SERVERNAME (имя сервера); 
--@@TRANCOUNT (возвращает уровень вложенности транзакции); 
--@@FETCH_STATUS (проверка ре-зультата считывания строк результи-рующего набора); 
--@@NESTLEVEL (уровень вложен-ности текущей процедуры).

--/*4*/
DECLARE @x INT = 2, @t INT = 3, @z FLOAT;    
IF (@t > @x)
BEGIN
    SET @z = POWER(SIN(@t), 2);
END 
ELSE IF (@t < @x)
BEGIN 
    SET @z = 4 * (@t + @x);
END
ELSE 
BEGIN
    SET @z = 1 - EXP(@x - 2);
END

PRINT 'Z = ' + CAST(@z AS VARCHAR)

-- 4.2

DECLARE @FullName NVARCHAR(100) = 'Макейчик Татьяна Леонидовна';
DECLARE @ShortName NVARCHAR(100);

SET @ShortName = LEFT(@FullName, CHARINDEX(' ', @FullName) - 1) + ' ' + 
                 LEFT(SUBSTRING(@FullName, CHARINDEX(' ', @FullName) + 1, LEN(@FullName)), 1) + '. ' +
                 LEFT(SUBSTRING(@FullName, LEN(@FullName) - CHARINDEX(' ', REVERSE(@FullName)) + 2, LEN(@FullName)), 1) + '.';

PRINT 'Сокращенное ФИО: ' + @ShortName;

-- 4.3

SELECT NAME, DATEDIFF(YEAR, BDAY, GETDATE()) AS Age 
	FROM STUDENT 
		WHERE MONTH(BDAY) = MONTH(DATEADD(MONTH, 1, GETDATE()));

-- 4.4
DECLARE @IDGROUP INT = 2;

SELECT p.IDSTUDENT, DATENAME(WEEKDAY, PDATE) AS DayOfWeek
		FROM PROGRESS p INNER JOIN STUDENT s
			ON p.IDSTUDENT = s.IDSTUDENT
				WHERE @IDGROUP = s.IDGROUP AND SUBJECT = 'ОАиП';

-- 5 
DECLARE @ACAPACITY INT = (SELECT COUNT(AUDITORIUM_CAPACITY) FROM AUDITORIUM),
      @LOW INT = (SELECT COUNT(A.AUDITORIUM_TYPE) FROM AUDITORIUM A WHERE A.AUDITORIUM_CAPACITY > 50)
IF (@LOW < 3) 
BEGIN
	PRINT 'Меньше трех аудиторий где меньше 50 вместимость';
END
ELSE
BEGIN
	PRINT 'Больше трех аудиторий где меньше 50 вместимость'; 
END



-- 6
DECLARE @average INT = (SELECT AVG(NOTE) 
	FROM FACULTY F INNER JOIN GROUPS G 
		ON F.FACULTY = G.FACULTY INNER JOIN STUDENT S 
			ON S.IDGROUP = G.IDGROUP INNER JOIN PROGRESS P 
			ON P.IDSTUDENT = S.IDSTUDENT)
SELECT CASE 
	WHEN @average BETWEEN 1 AND 4 THEN 'Плохо'
	WHEN @average BETWEEN 5 AND 8 THEN 'Хорошо'
	WHEN @average BETWEEN 9 AND 10 THEN 'Отлично'
END [Средний балл факультета ИТ]

-- 7
CREATE TABLE TTMPRY 
( TIND INTEGER,
  TFIELD INTEGER,
  TFIELD2 INTEGER
);


SET NOCOUNT ON;
CREATE TABLE TEMPTABLE (TIND INT, TFIELD INT, TFIELD2 INT);

DECLARE @counter INT = 0;
WHILE (@counter < 10)
BEGIN
    INSERT INTO TEMPTABLE (TIND, TFIELD, TFIELD2) 
	VALUES (FLOOR(300 * RAND()), FLOOR(300 * RAND()), FLOOR(300 * RAND()));

    SELECT @counter += 1;
    PRINT @counter;
END

-- 8
DECLARE @VFR INT = 1;
	PRINT @vfr + 1
	PRINT @vfr + 2
	RETURN 
	PRINT @vfr + 3

-- 9
BEGIN TRY
    SELECT 1 / 0;
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_LINE() AS ErrorLine,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState;
END CATCH;
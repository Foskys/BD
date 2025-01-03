﻿use univers

-- задание 1
SELECT P.PULPIT_NAME
FROM PULPIT P
WHERE P.FACULTY IN (
    SELECT PR.FACULTY
    FROM PROFESSION PR
    WHERE PR.PROFESSION_NAME LIKE '%технология%'
       OR PR.PROFESSION_NAME LIKE '%технологии%'
);

-- задание 2
SELECT DISTINCT P.PULPIT_NAME
FROM PULPIT P
INNER JOIN PROFESSION PR
    ON P.FACULTY = PR.FACULTY
WHERE PR.PROFESSION_NAME LIKE '%технология%'
   OR PR.PROFESSION_NAME LIKE '%технологии%';

-- задание 3
SELECT DISTINCT P.PULPIT_NAME
FROM PULPIT P
INNER JOIN FACULTY F
    ON P.FACULTY = F.FACULTY
INNER JOIN PROFESSION PR
    ON F.FACULTY = PR.FACULTY
WHERE PR.PROFESSION_NAME LIKE '%технология%'
   OR PR.PROFESSION_NAME LIKE '%технологии%';

-- задание 4
SELECT TOP 1 PERCENT A.AUDITORIUM_NAME, A.AUDITORIUM_CAPACITY, A.AUDITORIUM_TYPE
FROM AUDITORIUM A
WHERE A.AUDITORIUM_CAPACITY = (
    SELECT MAX(A1.AUDITORIUM_CAPACITY)
    FROM AUDITORIUM A1
    WHERE A1.AUDITORIUM_TYPE = A.AUDITORIUM_TYPE
);

-- задание 5
SELECT F.FACULTY_NAME
FROM FACULTY F
WHERE NOT EXISTS (
    SELECT 1
    FROM PULPIT P
    WHERE P.FACULTY = F.FACULTY
);

-- задание 6
SELECT
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'ОАиП') AS AVG_ОАиП,
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'БД') AS AVG_БД,
    (SELECT AVG(NOTE) FROM PROGRESS WHERE SUBJECT = 'СУБД') AS AVG_СУБД;

-- задание 7
SELECT SUBJECT
FROM PROGRESS
WHERE NOTE > ALL (
    SELECT NOTE
    FROM PROGRESS
    WHERE SUBJECT = 'ОАиП'
);

-- задание 8
SELECT SUBJECT
FROM PROGRESS
WHERE NOTE > ANY (
    SELECT NOTE
    FROM PROGRESS
    WHERE SUBJECT = 'ОАиП'
);
use master;
create database univer;
use univers;

-- �������� � ���������� ������� AUDITORIUM_TYPE
CREATE TABLE AUDITORIUM_TYPE (
    AUDITORIUM_TYPE CHAR(10) CONSTRAINT AUDITORIUM_TYPE_PK PRIMARY KEY,
    AUDITORIUM_TYPENAME VARCHAR(30)
);

INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES ('��', '����������');
INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES ('��-�', '������������ �����');
INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES ('��-�', '���������� � ���. ����������');
INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES ('��-X', '���������� �����������');
INSERT INTO AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) VALUES ('��-��', '����. ������������ �����');

-- �������� � ���������� ������� AUDITORIUM
CREATE TABLE AUDITORIUM (
    AUDITORIUM CHAR(20) CONSTRAINT AUDITORIUM_PK PRIMARY KEY,
    AUDITORIUM_TYPE CHAR(10) CONSTRAINT AUDITORIUM_AUDITORIUM_TYPE_FK FOREIGN KEY REFERENCES AUDITORIUM_TYPE(AUDITORIUM_TYPE),
    AUDITORIUM_CAPACITY INT CONSTRAINT AUDITORIUM_CAPACITY_CHECK DEFAULT 1 CHECK (AUDITORIUM_CAPACITY BETWEEN 1 AND 300), -- �����������
    AUDITORIUM_NAME VARCHAR(50)
);

INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('206-1', '206-1', '��-�', 15);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('301-1', '301-1', '��-�', 15);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('236-1', '236-1', '��', 60);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('313-1', '313-1', '��-�', 60);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('324-1', '324-1', '��-�', 50);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('413-1', '413-1', '��-�', 15);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('423-1', '423-1', '��-�', 90);
INSERT INTO AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) VALUES ('408-2', '408-2', '��', 90);

-- �������� � ���������� ������� FACULTY
CREATE TABLE FACULTY (
    FACULTY CHAR(10) CONSTRAINT FACULTY_PK PRIMARY KEY,
    FACULTY_NAME VARCHAR(50) DEFAULT '???'
);

INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('����', '���������� ���������� � �������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('���', '����������������� ���������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('���', '���������-������������� ���������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('����', '���������� � ������� ������ ��������������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('���', '���������� ������������ �������');
INSERT INTO FACULTY (FACULTY, FACULTY_NAME) VALUES ('��', '��������� �������������� ����������');

-- �������� � ���������� ������� PROFESSION
CREATE TABLE PROFESSION (
    PROFESSION CHAR(20) CONSTRAINT PROFESSION_PK PRIMARY KEY,
    FACULTY CHAR(10) CONSTRAINT PROFESSION_FACULTY_FK FOREIGN KEY REFERENCES FACULTY(FACULTY),
    PROFESSION_NAME VARCHAR(100),
    QUALIFICATION VARCHAR(50)
);

INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('��', '1-40 01 02', '�������������� ������� � ����������', '�������-�����������-�������������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('��', '1-47 01 01', '������������ ����', '��������-��������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('��', '1-36 06 01', '��������������� ������������ � ������� ��������� ����������', '�������-��������������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('����', '1-36 01 08', '��������������� � ������������ ������� �� �������������� ����������', '�������-�������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('����', '1-36 07 01', '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-75 01 01', '������ ���������', '������� ������� ���������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-75 02 01', '������-�������� �������������', '������� ������-��������� �������������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-89 02 02', '������ � ������������������', '���������� � ����� �������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-25 01 07', '��������� � ���������� �� �����������', '���������-��������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-25 01 08', '������������� ����, ������ � �����', '���������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('����', '1-36 05 01', '������ � ������������ ������� ���������', '�������-�������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('����', '1-46 01 01', '�������������� ����', '�������-��������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-48 01 02', '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-48 01 05', '���������� ���������� ����������� ���������', '�������-�����-��������');
INSERT INTO PROFESSION (FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION) VALUES ('���', '1-54 01 03', '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������');

-- �������� � ���������� ������� PULPIT
CREATE TABLE PULPIT (
    PULPIT CHAR(20) CONSTRAINT PULPIT_PK PRIMARY KEY,
    PULPIT_NAME VARCHAR(100),
    FACULTY CHAR(10) CONSTRAINT PULPIT_FACULTY_FK FOREIGN KEY REFERENCES FACULTY(FACULTY)
);

INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('����', '�������������� ������ � ����������', '��');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('��', '�����������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('��', '��������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('�����', '���������� � ����������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('����', '������ ������� � ������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('���', '������� � ������������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('������', '������������ �������������� � ������-��������� �������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('��', '���������� ����', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('�����', '������ ����� � ���������� �������������', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('���', '���������� �������������������� �����������', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('�����', '���������� � ������� ������� �� ���������', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('��', '������������ �����', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('���', '���������� ����������� ���������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('�������', '���������� �������������� ������� � ����� ���������� ����������', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('�����', '��������� � ��������� ���������� �����������', '����');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('����', '������������� ������ � ����������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('����', '����������� � ��������� ������������������', '���');
INSERT INTO PULPIT (PULPIT, PULPIT_NAME, FACULTY) VALUES ('������', '����������, �������������� �����, ������� � ������', '���');

-- �������� � ���������� ������� TEACHER
CREATE TABLE TEACHER (
    TEACHER CHAR(10) CONSTRAINT TEACHER_PK PRIMARY KEY,
    TEACHER_NAME VARCHAR(100),
    GENDER CHAR(1) CHECK (GENDER IN ('�', '�')),
    PULPIT CHAR(20) CONSTRAINT TEACHER_PULPIT_FK FOREIGN KEY REFERENCES PULPIT(PULPIT)
);

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('����', '������ �������� �������������', '�', '����');

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '��������� ����� ��������', '�', '����');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '����� ������� ��������', '�', '����');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '����� ������� �������������', '�', '����');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '����� ����� �������������', '�', '����');


INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('����', '������� ��������� ����������', '�', '����');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('����', '������ ������ ��������', '�', '��');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('����', '������� ������ ����������', '�', '������');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '���������� ������� ��������', '�', '������');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('���', '������ ������ ����������', '�', '��');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('�����', '��������� �������� ���������', '�', '�����');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('������', '���������� �������� ����������', '�', '��');
INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES ('�����', '�������� ������ ����������', '�', '��');

-- �������� � ���������� ������� SUBJECT
CREATE TABLE SUBJECT (
    SUBJECT CHAR(10) CONSTRAINT SUBJECT_PK PRIMARY KEY,
    SUBJECT_NAME VARCHAR(100) UNIQUE,
    PULPIT CHAR(20) CONSTRAINT SUBJECT_PULPIT_FK FOREIGN KEY REFERENCES PULPIT(PULPIT)
);

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '������� ���������� ������ ������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '���� ������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '�������������� ����������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '������ �������������� � ����������������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '������������� ������ � ������������ ��������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '���������������� ������� ����������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '������������� ������ ��������� ����������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '�������������� �������������� ������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '������������ ���������', '����');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '������������ �������������� �������', '����');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '���������� ����������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '�������������� ����������������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '���������� ������ ���', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '��������-��������������� ����������������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '��������� ������������������', '����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '������������� ������', '����');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('�������', '������ ������-��������� � ������������� ���������', '������');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '���������� ��������', '��');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '�����������', '�����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('��', '������������ �����', '��');

INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('���', '������ ��������� ����', '��');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '���������� � ������������ �������������', '�����');
INSERT INTO SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT) VALUES ('����', '���������� ���������� �������� ����������', '�������');


-- �������� � ���������� ������� GROUPS
CREATE TABLE GROUPS (
    IDGROUP INT IDENTITY(1,1) CONSTRAINT GROUP_PK PRIMARY KEY,
    FACULTY CHAR(10) CONSTRAINT GROUPS_FACULTY_FK FOREIGN KEY REFERENCES FACULTY(FACULTY),
    PROFESSION CHAR(20) CONSTRAINT GROUPS_PROFESSION_FK FOREIGN KEY REFERENCES PROFESSION(PROFESSION),
    YEAR_FIRST SMALLINT CHECK (YEAR_FIRST <= YEAR(GETDATE()))
);

INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-40 01 02', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-40 01 02', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-40 01 02', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-40 01 02', 2010);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-47 01 01', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-47 01 01', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-47 01 01', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-36 06 01', 2010);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-36 06 01', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-36 06 01', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('��', '1-36 06 01', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 01 08', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 01 08', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 07 01', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 07 01', 2010);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-48 01 02', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-48 01 02', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-48 01 05', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-54 01 03', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-75 01 01', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-75 02 01', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-75 02 01', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-89 02 02', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-89 02 02', 2011);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 05 01', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-36 05 01', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('����', '1-46 01 01', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-25 01 07', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-25 01 07', 2012);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-25 01 07', 2010);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-25 01 08', 2013);
INSERT INTO GROUPS (FACULTY, PROFESSION, YEAR_FIRST) VALUES ('���', '1-25 01 08', 2012);

-- �������� � ���������� ������� STUDENT
CREATE TABLE STUDENT (
    IDSTUDENT INT IDENTITY(1000,1) CONSTRAINT STUDENT_PK PRIMARY KEY,
    IDGROUP INT CONSTRAINT STUDENT_GROUP_FK FOREIGN KEY REFERENCES GROUPS(IDGROUP),
    NAME NVARCHAR(100),
    BDAY DATE,
    STAMP TIMESTAMP,
    INFO XML,
    FOTO VARBINARY(MAX)
);

INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (2, '����� ������� ��������', '12.07.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (2, '������� �������� ����������', '06.03.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (2, '�������� ����� �����������', '09.11.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (2, '������� ����� ���������', '04.10.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (2, '��������� ��������� ����������', '08.01.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (3, '������� ������ ���������', '02.08.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (3, '������� ��� ����������', '07.12.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (3, '������� ����� �����������', '02.12.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '������� ������ �����������', '08.03.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '������� ����� �������������', '02.06.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '�������� ����� �����������', '11.12.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '�������� ������� �������������', '11.05.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '����������� ������� ��������', '09.11.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (4, '�������� ������� ����������', '01.11.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (5, '�������� ����� ������������', '08.07.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (5, '������ ������� ����������', '02.11.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (5, '������ ��������� �����������', '07.05.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (5, '����� ��������� ���������', '04.08.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (6, '���������� ����� ����������', '08.11.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (6, '�������� ������ ��������', '02.03.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (6, '���������� ����� ����������', '04.06.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (6, '��������� ���������� ���������', '09.11.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (6, '����� ��������� �������', '04.07.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (7, '����������� ����� ������������', '03.01.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (7, '������� ���� ��������', '12.09.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (7, '��������� ������ ��������', '12.06.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (7, '���������� ��������� ����������', '09.02.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (7, '������� ������ ���������', '04.07.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (8, '������ ������� ���������', '08.01.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (8, '��������� ����� ����������', '12.05.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (8, '�������� ����� ����������', '08.11.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (8, '������� ������� ���������', '12.03.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (9, '�������� ����� �������������', '10.08.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (9, '���������� ������ ��������', '02.05.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (9, '������ ������� �������������', '08.01.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (9, '��������� ��������� ��������', '11.09.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (10, '������ ������� ������������', '08.01.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (10, '������ ������ ����������', '11.09.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (10, '����� ���� �������������', '06.04.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (10, '������� ������ ����������', '12.08.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '��������� ��������� ����������', '07.11.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '������ ������� ����������', '04.06.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '������� ����� ����������', '10.12.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '������� ������ ����������', '04.07.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '������� ����� ���������', '08.01.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (11, '����� ������� ����������', '02.09.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '���� ������ �����������', '11.12.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '������� ���� �������������', '10.06.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '��������� ���� ���������', '09.08.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '����� ����� ���������', '04.07.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '��������� ������ ����������', '08.03.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (12, '����� ����� ��������', '12.09.1995');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (13, '������ ����� ������������', '08.10.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (13, '���������� ����� ����������', '10.02.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (13, '�������� ������� �������������', '11.11.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (13, '���������� ����� ����������', '10.02.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (13, '����������� ����� ��������', '12.01.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (14, '�������� ������� �������������', '11.09.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (14, '������ �������� ����������', '01.12.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (14, '���� ������� ����������', '09.06.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (14, '�������� ���������� ����������', '05.01.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (14, '����������� ����� ����������', '01.07.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (15, '������� ��������� ���������', '07.04.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (15, '������ �������� ���������', '10.12.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (15, '��������� ����� ����������', '05.05.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (15, '���������� ����� ������������', '11.01.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (15, '�������� ����� ����������', '04.06.1992');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (16, '����� ����� ����������', '08.01.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (16, '��������� ��������� ���������', '07.02.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (16, '������ ������ �����������', '12.06.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (16, '������� ����� ��������', '03.07.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (16, '������ ������ ���������', '04.07.1994');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (17, '������� ��������� ����������', '08.11.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (17, '������ ����� ����������', '02.04.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (17, '������ ���� ��������', '03.06.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (17, '������� ������ ���������', '05.11.1993');
INSERT INTO STUDENT (IDGROUP, NAME, BDAY) VALUES (17, '������ ������ �������������', '03.07.1993');

-- �������� � ���������� ������� PROGRESS
CREATE TABLE PROGRESS (
    SUBJECT CHAR(10) CONSTRAINT PROGRESS_SUBJECT_FK FOREIGN KEY REFERENCES SUBJECT(SUBJECT),
    IDSTUDENT INT CONSTRAINT PROGRESS_IDSTUDENT_FK FOREIGN KEY REFERENCES STUDENT(IDSTUDENT),
    PDATE DATE,
    NOTE INT CHECK (NOTE BETWEEN 1 AND 10)
);

INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1001, '01.10.2013', 8);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1002, '01.10.2013', 7);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1003, '01.10.2013', 5);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1005, '01.10.2013', 4);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1014, '01.12.2013', 5);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1015, '01.12.2013', 9);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1016, '01.12.2013', 5);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('����', 1017, '01.12.2013', 4);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1018, '06.05.2013', 4);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1019, '06.05.2013', 7);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1020, '06.05.2013', 7);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1021, '06.05.2013', 9);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1022, '06.05.2013', 5);
INSERT INTO PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) VALUES ('��', 1023, '06.05.2013', 6);
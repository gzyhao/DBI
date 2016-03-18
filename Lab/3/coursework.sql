# Switch to the correct database
use db_zy15798;

# For legacy
DROP TABLE IF EXISTS Grade;
DROP TABLE IF EXISTS Module;
DROP TABLE IF EXISTS Student;

# Create tables for Question 2
CREATE TABLE Student
(
    sID int AUTO_INCREMENT NOT NULL,
    sName VARCHAR(50) NOT NULL,
    GPA FLOAT,
    CONSTRAINT Stud_fk
        PRIMARY KEY (sID)
) ENGINE = InnoDB;

CREATE TABLE Module
(
    mCode CHAR(6) NOT NULL,
    mCredits TINYINT NOT NULL DEFAULT 10,
    mTitle VARCHAR(100) NOT NULL,
    CONSTRAINT Mod_fk
        PRIMARY KEY (mCode)
) ENGINE = InnoDB;

CREATE TABLE Grade
(
    sID INT,
    mCode CHAR(6),
    gMark TINYINT,
    CONSTRAINT Gra_fk1
        FOREIGN KEY (mCode)
        REFERENCES Module (mCode)
        ON DELETE CASCADE
) ENGINE = InnoDB;

# Insert data for Question 3
INSERT INTO Student
    VALUES
    (1, "John", 18.5),
    (2, "Mary", 19),
    (3, "James", 18),
    (4, "Amy", 17),
    (5, "John", 18.5),
    (6, "Amy", 18);

INSERT INTO Module
    VALUES
    ("G51DBI", 10, "Databases and Interfaces"),
    ("G51PRG", 20, "Programming"),
    ("G51IAI", 10, "Artificial Intelligence"),
    ("G51ADS", 10, "Algorithms");

INSERT INTO Grade
    VALUES
    (1, "G51DBI", 70),
    (1, "G51PRG", 60),
    (1, "G51IAI", 60),
    (2, "G51DBI", 80),
    (2, "G51PRG", 50),
    (2, "G51IAI", 60),
    (3, "G51DBI", 50),
    (3, "G51PRG", 50),
    (3, "G51IAI", 60),
    (4, "G51DBI", 75),
    (4, "G51PRG", 65),
    (4, "G51IAI", 55),
    (5, "G51DBI", 70),
    (5, "G51PRG", 50),
    (5, "G51IAI", 50),
    (6, "G51DBI", 70),
    (6, "G51PRG", 65),
    (6, "G51IAI", 55);

# Make a query for enrolled students for Question 4
-- CROSS PRODUCT
SELECT DISTINCT Student.sID, sName
    FROM Student CROSS JOIN Grade
    WHERE Student.sID = Grade.sID;

-- INNER JOIN
SELECT DISTINCT sID, sName
    FROM Student INNER JOIN Grade
    USING (sID);

# Make a query for students DBI > 60 && PRG >= 65 for Question 5
SELECT DISTINCT Student.sID, sName, GPA
    FROM Student CROSS JOIN Grade
    WHERE
        ((mCode = "G51DBI" AND gMark > 60)
        OR
        (mCode = "G51PRG" AND gMark >= 65))
        AND
        Student.sID = Grade.sID;

# Insert a new student for Question 6
INSERT INTO Student
  VALUE
  (7, "George", 20);

# Make a query for Question 7
SELECT sID, sName, mCode, gMark
  FROM Student LEFT JOIN Grade
    USING(sID)
  WHERE
    sID IS NOT NULL
    AND
    sName IS NOT NULL
    AND
    GPA IS NOT NULL;

# Insert a new grade for Question 8
INSERT INTO Grade
  VALUE
  (9, "G51DBI", 50);

# Make a query for Question 9
SELECT mCode, gMark, sID, sName, GPA
  FROM Grade LEFT JOIN Student
    USING (sID);

#MAke a query for Question 10
SELECT Student.sID, sName, GPA, mCode, gMark
  FROM Grade LEFT JOIN Student
    USING (sID);

# Add a foreign key to table GRADE for question 11
-- delete reference-to-null
DELETE FROM Grade
  WHERE sID = 9;

ALTER TABLE Grade
  ADD CONSTRAINT gr_fk1
    FOREIGN KEY (sID)
      REFERENCES Student (sID)
      ON DELETE CASCADE;

# Make a query for Question 12
SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51DBI"
UNION
SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51PRG"
UNION
SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51IAI";

# Make a query for Question 13
SELECT gMark AS Mark, COUNT(gMark) AS Count
  FROM Grade
  GROUP BY gMark;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Module;
DROP TABLE IF EXISTS Grade;

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
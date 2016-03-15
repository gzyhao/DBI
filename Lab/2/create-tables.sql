CREATE TABLE Courses
(
    cID VARCHAR(10) NOT NULL UNIQUE KEY,
    cTitle VARCHAR(40) NOT NULL,
    CONSTRAINT ID
        PRIMARY KEY (cID)
) ENGINE = InnoDB;

CREATE TABLE Instructors
(
    instrID VARCHAR(10) NOT NULL UNIQUE KEY,
    instrName VARCHAR(30) NOT NULL,
    telNO VARCHAR(16),
    CONSTRAINT ID
        PRIMARY KEY (instrID)
) ENGINE = InnoDB;

CREATE TABLE Trainees
(
    tName VARCHAR(30) NOT NULL,
    address VARCHAR(10)
) ENGINE = InnoDB;

CREATE TABLE Coursetrainee
(
    cID VARCHAR(10) NOT NULL,
    traineeID INT NOT NULL,
    Mark INT,
    CONSTRAINT CourseID_fk
        FOREIGN KEY (cID)
        REFERENCES Courses (cID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE Teaminstructor
(
    cID VARCHAR(10) NOT NULL,
    instrID VARCHAR(10) NOT NULL,
    CONSTRAINT tCourseID
        FOREIGN KEY (cID)
        REFERENCES Courses (cID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT tInstructorID
        FOREIGN KEY (instrID)
        REFERENCES Instructors (instrID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;
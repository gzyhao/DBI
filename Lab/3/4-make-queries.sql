SELECT DISTINCT Student.sID, sName, GPA
    FROM Student CROSS JOIN GRADE
    WHERE
        ((mCode = "G51DBI" AND gMark > 60)
        OR
        (mCode = "G51PRG" AND gMark >= 65))
        AND
        Student.sID = GRADE.sID;
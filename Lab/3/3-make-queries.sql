SELECT DISTINCT Student.sID, sName
    FROM Student CROSS JOIN Grade
    WHERE Student.sID = Grade.sID;

SELECT DISTINCT sID, sName
    FROM Student INNER JOIN Grade
    USING (sID);
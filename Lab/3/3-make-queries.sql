SELECT Student.sID, sName, mCode
    FROM Student CROSS JOIN Grade
    WHERE Student.sID = Grade.sID;

SELECT sID, sName, mCode
    FROM Student INNER JOIN Grade
    USING (sID);
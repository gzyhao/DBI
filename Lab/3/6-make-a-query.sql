SELECT sID, sName, mCode, gMark
  FROM Student LEFT JOIN Grade
    USING(sID)
  WHERE
    sID IS NOT NULL
    AND
    sName IS NOT NULL
    AND
    GPA IS NOT NULL;
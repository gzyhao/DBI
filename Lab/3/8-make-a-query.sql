SELECT mCode, gMark, sID, sName, GPA
  FROM Grade LEFT JOIN student
    USING (sID);
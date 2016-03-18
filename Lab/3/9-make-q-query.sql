SELECT student.sID, sName, GPA, mCode, gMark
  FROM Grade LEFT JOIN student
    USING (sID);
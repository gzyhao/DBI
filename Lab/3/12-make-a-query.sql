SELECT gMark AS Mark, COUNT(gMark) AS Count
  FROM grade
  GROUP BY gMark;
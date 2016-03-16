SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51DBI"
UNION
SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51PRG"
UNION
SELECT mCode, MAX(gMark) AS Max, MIN(gMark) AS Min, AVG(gMark) AS Average
  FROM Grade WHERE mCode = "G51IAI";
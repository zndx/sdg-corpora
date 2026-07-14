CREATE TABLE SubjectGrade (
  id INTEGER NOT NULL,
  subjectName VARCHAR(32),
  grade VARCHAR(32),
  score INTEGER,
  term VARCHAR(32),
  recordId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (recordId) REFERENCES AcademicRecord (recordId)
);

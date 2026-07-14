CREATE TABLE AcademicRecordSubjectGrade (
  recordId INTEGER NOT NULL,
  gradeId INTEGER NOT NULL,
  PRIMARY KEY (recordId, gradeId),
  FOREIGN KEY (recordId) REFERENCES AcademicRecord (recordId),
  FOREIGN KEY (gradeId) REFERENCES SubjectGrade (id)
);

CREATE TABLE AcademicRecord (
  recordId INTEGER NOT NULL,
  gradeLevel VARCHAR(32),
  term VARCHAR(32),
  conductScore DECIMAL,
  academicScore DECIMAL,
  overallWeightedScore DECIMAL,
  applicationId INTEGER,
  PRIMARY KEY (recordId),
  FOREIGN KEY (applicationId) REFERENCES AdmissionApplication (applicationId)
);

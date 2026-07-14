CREATE TABLE AdmissionApplication (
  applicationId INTEGER NOT NULL,
  academicYear VARCHAR(32),
  submissionDate TIMESTAMP,
  status VARCHAR(32),
  totalScore DECIMAL,
  rank INTEGER,
  interviewDate TIMESTAMP,
  interviewResult VARCHAR(32),
  studentId INTEGER,
  recordId INTEGER,
  scoreId INTEGER,
  PRIMARY KEY (applicationId),
  FOREIGN KEY (studentId) REFERENCES Student (id),
  FOREIGN KEY (recordId) REFERENCES AcademicRecord (recordId),
  FOREIGN KEY (scoreId) REFERENCES InterviewScore (scoreId)
);

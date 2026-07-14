CREATE TABLE Student (
  id INTEGER NOT NULL,
  studentId VARCHAR(32),
  fullName VARCHAR(36),
  phone VARCHAR(32),
  emailAddress VARCHAR(32),
  isGraduateStudent BOOLEAN,
  programId INTEGER,
  applicationId INTEGER,
  progressId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES AcademicProgram (id),
  FOREIGN KEY (applicationId) REFERENCES FinancialAidApplication (id),
  FOREIGN KEY (progressId) REFERENCES SatisfactoryAcademicProgress (id)
);

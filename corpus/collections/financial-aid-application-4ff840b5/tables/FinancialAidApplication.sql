CREATE TABLE FinancialAidApplication (
  id INTEGER NOT NULL,
  applicationId VARCHAR(32),
  submissionDate TIMESTAMP,
  academicYear VARCHAR(32),
  isElectronicSignatureAccepted BOOLEAN,
  hasPriorFederalAid BOOLEAN,
  status VARCHAR(32),
  studentId INTEGER,
  awardId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (studentId) REFERENCES Student (id),
  FOREIGN KEY (awardId) REFERENCES FinancialAward (id)
);

CREATE TABLE FinancialAidApplicationAcademicTerm (
  applicationId INTEGER NOT NULL,
  termId VARCHAR(32) NOT NULL,
  PRIMARY KEY (applicationId, termId),
  FOREIGN KEY (applicationId) REFERENCES FinancialAidApplication (id),
  FOREIGN KEY (termId) REFERENCES AcademicTerm (termId)
);

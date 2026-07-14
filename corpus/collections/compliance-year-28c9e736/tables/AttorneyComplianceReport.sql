CREATE TABLE AttorneyComplianceReport (
  attorneyId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (attorneyId, reportId),
  FOREIGN KEY (attorneyId) REFERENCES Attorney (id),
  FOREIGN KEY (reportId) REFERENCES ComplianceReport (id)
);

CREATE TABLE ComplianceYearComplianceReport (
  yearId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (yearId, reportId),
  FOREIGN KEY (yearId) REFERENCES ComplianceYear (yearId),
  FOREIGN KEY (reportId) REFERENCES ComplianceReport (id)
);

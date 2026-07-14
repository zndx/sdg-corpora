CREATE TABLE Auditor (
  id INTEGER NOT NULL,
  auditorId VARCHAR(32),
  auditorName VARCHAR(32),
  licenseNumber VARCHAR(32),
  firmName VARCHAR(32),
  certificationBody VARCHAR(32),
  statementId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (statementId) REFERENCES FinancialStatement (statementId)
);

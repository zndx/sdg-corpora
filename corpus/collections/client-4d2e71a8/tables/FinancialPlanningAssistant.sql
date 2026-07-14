CREATE TABLE FinancialPlanningAssistant (
  id INTEGER NOT NULL,
  employeeId VARCHAR(32),
  fullName VARCHAR(36),
  licenseStatus VARCHAR(32),
  licenseExpiryDate DATE,
  officeLocation VARCHAR(32),
  employmentStatus VARCHAR(32),
  yearsExperience INTEGER,
  plannerId INTEGER,
  transactionId INTEGER,
  clientId INTEGER,
  recordId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (plannerId) REFERENCES FinancialPlanner (id),
  FOREIGN KEY (transactionId) REFERENCES TradeTransaction (transactionId),
  FOREIGN KEY (clientId) REFERENCES Client (id),
  FOREIGN KEY (recordId) REFERENCES ComplianceRecord (recordId)
);

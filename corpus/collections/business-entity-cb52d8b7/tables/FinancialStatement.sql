CREATE TABLE FinancialStatement (
  statementId INTEGER NOT NULL,
  statementType VARCHAR(32),
  reportingPeriod DATE,
  totalRevenue DECIMAL,
  totalExpenses DECIMAL,
  netIncome VARCHAR(32),
  preparedBy VARCHAR(32),
  auditStatus VARCHAR(32),
  entityId INTEGER,
  auditorId INTEGER,
  PRIMARY KEY (statementId),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id),
  FOREIGN KEY (auditorId) REFERENCES Auditor (id)
);

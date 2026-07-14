CREATE TABLE ComplianceRecord (
  recordId INTEGER NOT NULL,
  recordType VARCHAR(32),
  issueDate DATE,
  expiryDate DATE,
  issuingAuthority VARCHAR(32),
  verificationStatus VARCHAR(32),
  documentUrl VARCHAR(55),
  plannerId INTEGER,
  assistantId INTEGER,
  transactionId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (recordId),
  FOREIGN KEY (plannerId) REFERENCES FinancialPlanner (id),
  FOREIGN KEY (assistantId) REFERENCES FinancialPlanningAssistant (id),
  FOREIGN KEY (transactionId) REFERENCES TradeTransaction (transactionId)
);

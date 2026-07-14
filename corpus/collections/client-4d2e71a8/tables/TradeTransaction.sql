CREATE TABLE TradeTransaction (
  transactionId INTEGER NOT NULL,
  transactionDate TIMESTAMP,
  transactionType VARCHAR(32),
  amount DECIMAL,
  currencyCode VARCHAR(44),
  executionStatus VARCHAR(32),
  settlementDate DATE,
  assetId INTEGER,
  accountId INTEGER,
  clientId INTEGER,
  assistantId INTEGER,
  PRIMARY KEY (transactionId),
  FOREIGN KEY (assetId) REFERENCES FinancialAsset (id),
  FOREIGN KEY (accountId) REFERENCES FinancialAccount (id),
  FOREIGN KEY (clientId) REFERENCES Client (id),
  FOREIGN KEY (assistantId) REFERENCES FinancialPlanningAssistant (id)
);

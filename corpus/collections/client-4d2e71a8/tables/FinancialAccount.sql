CREATE TABLE FinancialAccount (
  id INTEGER NOT NULL,
  accountNumber VARCHAR(32),
  accountType VARCHAR(32),
  openDate DATE,
  currentBalance VARCHAR(32),
  currencyCode VARCHAR(44),
  accountStatus VARCHAR(32),
  lastStatementDate DATE,
  clientId INTEGER,
  assetId INTEGER,
  plannerId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clientId) REFERENCES Client (id),
  FOREIGN KEY (assetId) REFERENCES FinancialAsset (id),
  FOREIGN KEY (plannerId) REFERENCES FinancialPlanner (id)
);

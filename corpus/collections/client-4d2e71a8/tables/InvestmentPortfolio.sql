CREATE TABLE InvestmentPortfolio (
  id INTEGER NOT NULL,
  portfolioId VARCHAR(32),
  riskProfile VARCHAR(32),
  totalValue DECIMAL,
  currencyCode VARCHAR(44),
  lastRebalanceDate DATE,
  portfolioStatus VARCHAR(32),
  clientId INTEGER,
  assetId INTEGER,
  plannerId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clientId) REFERENCES Client (id),
  FOREIGN KEY (assetId) REFERENCES FinancialAsset (id),
  FOREIGN KEY (plannerId) REFERENCES FinancialPlanner (id)
);

CREATE TABLE Client (
  id INTEGER NOT NULL,
  clientId VARCHAR(32),
  fullName VARCHAR(36),
  dateOfBirth DATE,
  contactEmail VARCHAR(32),
  contactPhone VARCHAR(32),
  residentialAddress VARCHAR(32),
  clientStatus VARCHAR(32),
  accountId INTEGER,
  portfolioId INTEGER,
  plannerId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (accountId) REFERENCES FinancialAccount (id),
  FOREIGN KEY (portfolioId) REFERENCES InvestmentPortfolio (id),
  FOREIGN KEY (plannerId) REFERENCES FinancialPlanner (id)
);

CREATE TABLE FinancialAsset (
  id INTEGER NOT NULL,
  assetId VARCHAR(40),
  tickerSymbol VARCHAR(32),
  assetType VARCHAR(32),
  currentMarketValue DECIMAL,
  purchaseDate DATE,
  purchasePrice DECIMAL,
  quantity INTEGER,
  assetStatus VARCHAR(32),
  portfolioId INTEGER,
  transactionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (portfolioId) REFERENCES InvestmentPortfolio (id),
  FOREIGN KEY (transactionId) REFERENCES TradeTransaction (transactionId)
);

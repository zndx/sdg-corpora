CREATE TABLE PricingTier (
  tierId INTEGER NOT NULL,
  tierIdentifier VARCHAR(32),
  tierName VARCHAR(32),
  costPerChild DECIMAL,
  ticketCount INTEGER,
  totalCost DECIMAL,
  paymentMethod VARCHAR(32),
  sessionId INTEGER,
  PRIMARY KEY (tierId),
  FOREIGN KEY (sessionId) REFERENCES ProgramSession (id)
);

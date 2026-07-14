CREATE TABLE MarketCondition (
  conditionId INTEGER NOT NULL,
  conditionName VARCHAR(32),
  impactLevel VARCHAR(32),
  trendDirection VARCHAR(32),
  measurementValue DECIMAL,
  lastUpdated TIMESTAMP,
  brandId VARCHAR(32),
  goalId INTEGER,
  executiveId INTEGER,
  PRIMARY KEY (conditionId),
  FOREIGN KEY (brandId) REFERENCES Brand (brandId),
  FOREIGN KEY (goalId) REFERENCES BrandGoal (goalId),
  FOREIGN KEY (executiveId) REFERENCES Executive (executiveId)
);

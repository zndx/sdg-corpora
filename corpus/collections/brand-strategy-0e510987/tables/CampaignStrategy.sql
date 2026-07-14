CREATE TABLE CampaignStrategy (
  campaignId INTEGER NOT NULL,
  campaignName VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  budget DECIMAL,
  status VARCHAR(32),
  channel VARCHAR(32),
  targetEngagementRate DECIMAL,
  strategyId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (campaignId),
  FOREIGN KEY (strategyId) REFERENCES BrandStrategy (strategyId)
);

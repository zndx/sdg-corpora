CREATE TABLE Brand (
  brandId VARCHAR(32) NOT NULL,
  brandName VARCHAR(33),
  foundingYear INTEGER,
  annualRevenue VARCHAR(32),
  totalStoreCount INTEGER,
  headquartersLocation VARCHAR(32),
  parentCompany VARCHAR(35),
  teamId VARCHAR(32),
  conditionId INTEGER,
  PRIMARY KEY (brandId),
  FOREIGN KEY (teamId) REFERENCES LeadershipTeam (teamId),
  FOREIGN KEY (conditionId) REFERENCES MarketCondition (conditionId)
);

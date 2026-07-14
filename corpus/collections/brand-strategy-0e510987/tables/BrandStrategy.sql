CREATE TABLE BrandStrategy (
  strategyId INTEGER NOT NULL,
  brandName VARCHAR(33),
  positioningStatement VARCHAR(32),
  targetAudience VARCHAR(32),
  status VARCHAR(32),
  createdDate TIMESTAMP,
  lastModified TIMESTAMP,
  PRIMARY KEY (strategyId)
);

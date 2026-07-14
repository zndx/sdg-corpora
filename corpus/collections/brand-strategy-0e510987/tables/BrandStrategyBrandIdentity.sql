CREATE TABLE BrandStrategyBrandIdentity (
  strategyId INTEGER NOT NULL,
  identityId VARCHAR(44) NOT NULL,
  PRIMARY KEY (strategyId, identityId),
  FOREIGN KEY (strategyId) REFERENCES BrandStrategy (strategyId),
  FOREIGN KEY (identityId) REFERENCES BrandIdentity (identityId)
);

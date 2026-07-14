CREATE TABLE BrandIdentity (
  identityId VARCHAR(44) NOT NULL,
  brandName VARCHAR(33),
  logoUrl VARCHAR(58),
  primaryColor VARCHAR(32),
  secondaryColor VARCHAR(32),
  fontFamily VARCHAR(32),
  version VARCHAR(32),
  strategyId INTEGER,
  PRIMARY KEY (identityId),
  FOREIGN KEY (strategyId) REFERENCES BrandStrategy (strategyId)
);

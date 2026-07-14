CREATE TABLE GeographicRegion (
  id INTEGER NOT NULL,
  regionCode VARCHAR(40),
  regionName VARCHAR(32),
  regionType VARCHAR(32),
  population INTEGER,
  socialEnterpriseDensity DECIMAL,
  isRural BOOLEAN,
  enterpriseId VARCHAR(32),
  countryId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (enterpriseId) REFERENCES SocialEnterprise (enterpriseId),
  FOREIGN KEY (countryId) REFERENCES Country (id)
);

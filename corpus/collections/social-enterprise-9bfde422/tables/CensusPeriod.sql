CREATE TABLE CensusPeriod (
  periodId VARCHAR(44) NOT NULL,
  startYear INTEGER,
  endYear INTEGER,
  isBaseline BOOLEAN,
  totalEnterprises INTEGER,
  growthRate DECIMAL,
  enterpriseId VARCHAR(32),
  PRIMARY KEY (periodId),
  FOREIGN KEY (enterpriseId) REFERENCES SocialEnterprise (enterpriseId)
);

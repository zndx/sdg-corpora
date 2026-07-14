CREATE TABLE SocialEnterprise (
  enterpriseId VARCHAR(32) NOT NULL,
  legalForm VARCHAR(32),
  annualIncome DECIMAL,
  ageYears INTEGER,
  isCharity BOOLEAN,
  selfIdentifiesAsSocialEnterprise BOOLEAN,
  headquartersLocation VARCHAR(32),
  primaryMarketType VARCHAR(32),
  regionId INTEGER,
  domainId INTEGER,
  sectorId INTEGER,
  periodId VARCHAR(44),
  PRIMARY KEY (enterpriseId),
  FOREIGN KEY (regionId) REFERENCES GeographicRegion (id),
  FOREIGN KEY (domainId) REFERENCES ServiceDomain (domainId),
  FOREIGN KEY (sectorId) REFERENCES ClientSector (id),
  FOREIGN KEY (periodId) REFERENCES CensusPeriod (periodId)
);

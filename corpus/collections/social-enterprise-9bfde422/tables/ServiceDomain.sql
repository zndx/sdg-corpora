CREATE TABLE ServiceDomain (
  domainId INTEGER NOT NULL,
  domainCode INTEGER,
  domainName VARCHAR(32),
  sectorShareOfIncome DECIMAL,
  isPrimaryProvider BOOLEAN,
  enterpriseId VARCHAR(32),
  PRIMARY KEY (domainId),
  FOREIGN KEY (enterpriseId) REFERENCES SocialEnterprise (enterpriseId)
);

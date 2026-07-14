CREATE TABLE ClientSector (
  id INTEGER NOT NULL,
  sectorCode INTEGER,
  sectorName VARCHAR(32),
  isPublicSector BOOLEAN,
  incomeShare DECIMAL,
  enterpriseId VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (enterpriseId) REFERENCES SocialEnterprise (enterpriseId)
);

CREATE TABLE IntelligenceRepository (
  repositoryId INTEGER NOT NULL,
  facilityIdentifier VARCHAR(32),
  facilityName VARCHAR(32),
  locationCity VARCHAR(32),
  locationState VARCHAR(32),
  operationalStatus VARCHAR(32),
  jurisdictionCoverage VARCHAR(32),
  unitId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (repositoryId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id)
);

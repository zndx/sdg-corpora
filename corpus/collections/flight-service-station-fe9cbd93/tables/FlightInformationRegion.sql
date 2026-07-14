CREATE TABLE FlightInformationRegion (
  regionId INTEGER NOT NULL,
  firIdentifier VARCHAR(32),
  firName VARCHAR(32),
  firType VARCHAR(32),
  areaSize DECIMAL,
  upperLimit VARCHAR(32),
  lowerLimit VARCHAR(32),
  controllingAuthority VARCHAR(32),
  overlapsRegionId INTEGER,
  PRIMARY KEY (regionId),
  FOREIGN KEY (overlapsRegionId) REFERENCES FlightInformationRegion (regionId)
);

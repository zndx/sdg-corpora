CREATE TABLE AnimalConfinementBuilding (
  id INTEGER NOT NULL,
  buildingIdentifier VARCHAR(32),
  buildingType VARCHAR(32),
  constructionStatus VARCHAR(32),
  facilityZipCode VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode)
);

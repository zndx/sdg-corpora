CREATE TABLE AnimalCapacity (
  capacityId INTEGER NOT NULL,
  animalType VARCHAR(32),
  capacityCount INTEGER,
  facilityClassification VARCHAR(32),
  buildingId INTEGER,
  facilityZipCode VARCHAR(44),
  PRIMARY KEY (capacityId),
  FOREIGN KEY (buildingId) REFERENCES AnimalConfinementBuilding (id),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode)
);

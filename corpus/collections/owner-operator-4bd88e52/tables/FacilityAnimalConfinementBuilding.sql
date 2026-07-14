CREATE TABLE FacilityAnimalConfinementBuilding (
  facilityZipCode VARCHAR(44) NOT NULL,
  buildingId INTEGER NOT NULL,
  PRIMARY KEY (facilityZipCode, buildingId),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode),
  FOREIGN KEY (buildingId) REFERENCES AnimalConfinementBuilding (id)
);

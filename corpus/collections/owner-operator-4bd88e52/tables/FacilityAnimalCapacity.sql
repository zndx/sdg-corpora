CREATE TABLE FacilityAnimalCapacity (
  facilityZipCode VARCHAR(44) NOT NULL,
  capacityId INTEGER NOT NULL,
  PRIMARY KEY (facilityZipCode, capacityId),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode),
  FOREIGN KEY (capacityId) REFERENCES AnimalCapacity (capacityId)
);

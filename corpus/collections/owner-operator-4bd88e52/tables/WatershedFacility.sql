CREATE TABLE WatershedFacility (
  watershedId INTEGER NOT NULL,
  facilityZipCode VARCHAR(44) NOT NULL,
  PRIMARY KEY (watershedId, facilityZipCode),
  FOREIGN KEY (watershedId) REFERENCES Watershed (id),
  FOREIGN KEY (facilityZipCode) REFERENCES Facility (zipCode)
);

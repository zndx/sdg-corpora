CREATE TABLE Facility (
  facilityName VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zipCode VARCHAR(44) NOT NULL,
  county VARCHAR(32),
  township VARCHAR(32),
  section VARCHAR(32),
  contactPhone VARCHAR(32),
  contactEmail VARCHAR(32),
  watershedId INTEGER,
  PRIMARY KEY (zipCode),
  FOREIGN KEY (watershedId) REFERENCES Watershed (id)
);

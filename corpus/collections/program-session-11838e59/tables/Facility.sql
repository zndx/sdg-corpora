CREATE TABLE Facility (
  facilityId INTEGER NOT NULL,
  facilityIdentifier VARCHAR(32),
  facilityName VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  postalCode VARCHAR(35),
  phoneNumber VARCHAR(32),
  website VARCHAR(56),
  PRIMARY KEY (facilityId)
);

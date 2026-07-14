CREATE TABLE IntellectualProperty (
  propertyId INTEGER NOT NULL,
  ipId VARCHAR(35),
  ipType VARCHAR(32),
  registrationDate DATE,
  expirationDate DATE,
  owner VARCHAR(32),
  jurisdiction VARCHAR(32),
  entityId INTEGER,
  jurisdictionCountryCode VARCHAR(32),
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (propertyId),
  FOREIGN KEY (entityId) REFERENCES BusinessEntity (id),
  FOREIGN KEY (jurisdictionCountryCode) REFERENCES Jurisdiction (countryCode)
);

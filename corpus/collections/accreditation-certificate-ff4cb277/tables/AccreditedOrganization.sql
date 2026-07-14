CREATE TABLE AccreditedOrganization (
  legalName VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  postalCode VARCHAR(35) NOT NULL,
  contactPhone VARCHAR(32),
  certificateId INTEGER,
  PRIMARY KEY (postalCode),
  FOREIGN KEY (certificateId) REFERENCES AccreditationCertificate (id)
);

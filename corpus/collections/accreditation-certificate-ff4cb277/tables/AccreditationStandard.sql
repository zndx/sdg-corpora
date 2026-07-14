CREATE TABLE AccreditationStandard (
  standardId INTEGER NOT NULL,
  standardNumber VARCHAR(32),
  standardTitle VARCHAR(32),
  publicationYear INTEGER,
  issuingOrganization VARCHAR(33),
  certificateId INTEGER,
  PRIMARY KEY (standardId),
  FOREIGN KEY (certificateId) REFERENCES AccreditationCertificate (id)
);

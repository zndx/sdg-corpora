CREATE TABLE AccreditationCertificate (
  id INTEGER NOT NULL,
  certificateNumber VARCHAR(32),
  issueDate DATE,
  expiryDate DATE,
  status VARCHAR(32),
  issuingBodyName VARCHAR(32),
  organizationPostalCode VARCHAR(35),
  scopeId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (organizationPostalCode) REFERENCES AccreditedOrganization (postalCode),
  FOREIGN KEY (scopeId) REFERENCES AccreditationScope (scopeId)
);

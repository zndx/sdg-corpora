CREATE TABLE NonprofitOrganization (
  organizationId INTEGER NOT NULL,
  legalName VARCHAR(32),
  taxExemptStatus VARCHAR(32),
  foundingYear INTEGER,
  operationalStatus VARCHAR(32),
  foundingLocation VARCHAR(32),
  personId INTEGER,
  PRIMARY KEY (organizationId),
  FOREIGN KEY (personId) REFERENCES Person (personId)
);

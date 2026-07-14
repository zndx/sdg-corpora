CREATE TABLE SupportResource (
  resourceId INTEGER NOT NULL,
  resourceName VARCHAR(32),
  resourceType VARCHAR(32),
  availabilityStatus VARCHAR(32),
  patientId INTEGER,
  PRIMARY KEY (resourceId),
  FOREIGN KEY (patientId) REFERENCES Patient (id)
);

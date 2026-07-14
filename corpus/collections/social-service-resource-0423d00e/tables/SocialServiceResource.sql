CREATE TABLE SocialServiceResource (
  id INTEGER NOT NULL,
  resourceIdentifier VARCHAR(32),
  resourceName VARCHAR(32),
  serviceCategory VARCHAR(32),
  isConfidential BOOLEAN,
  isFree BOOLEAN,
  operatingHours VARCHAR(32),
  organizationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id)
);

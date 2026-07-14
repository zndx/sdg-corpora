CREATE TABLE MissionService (
  id INTEGER NOT NULL,
  serviceId VARCHAR(44),
  serviceName VARCHAR(32),
  serviceCategory VARCHAR(32),
  securityClassification VARCHAR(32),
  availabilityStatus VARCHAR(32),
  providerOrganization VARCHAR(32),
  environmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (environmentId) REFERENCES InformationEnvironment (id)
);

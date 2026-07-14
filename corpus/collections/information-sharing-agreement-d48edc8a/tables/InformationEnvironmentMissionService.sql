CREATE TABLE InformationEnvironmentMissionService (
  environmentId INTEGER NOT NULL,
  serviceId INTEGER NOT NULL,
  PRIMARY KEY (environmentId, serviceId),
  FOREIGN KEY (environmentId) REFERENCES InformationEnvironment (id),
  FOREIGN KEY (serviceId) REFERENCES MissionService (id)
);

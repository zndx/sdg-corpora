CREATE TABLE InteroperabilityStandardMissionService (
  standardId INTEGER NOT NULL,
  serviceId INTEGER NOT NULL,
  PRIMARY KEY (standardId, serviceId),
  FOREIGN KEY (standardId) REFERENCES InteroperabilityStandard (id),
  FOREIGN KEY (serviceId) REFERENCES MissionService (id)
);

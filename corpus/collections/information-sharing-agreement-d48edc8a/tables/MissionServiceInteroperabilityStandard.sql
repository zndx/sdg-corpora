CREATE TABLE MissionServiceInteroperabilityStandard (
  serviceId INTEGER NOT NULL,
  standardId INTEGER NOT NULL,
  PRIMARY KEY (serviceId, standardId),
  FOREIGN KEY (serviceId) REFERENCES MissionService (id),
  FOREIGN KEY (standardId) REFERENCES InteroperabilityStandard (id)
);

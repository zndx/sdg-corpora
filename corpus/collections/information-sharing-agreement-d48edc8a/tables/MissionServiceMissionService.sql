CREATE TABLE MissionServiceMissionService (
  serviceId INTEGER NOT NULL,
  usedByServiceId INTEGER NOT NULL,
  PRIMARY KEY (serviceId, usedByServiceId),
  FOREIGN KEY (serviceId) REFERENCES MissionService (id),
  FOREIGN KEY (usedByServiceId) REFERENCES MissionService (id)
);

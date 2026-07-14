CREATE TABLE EmergencyDepartment (
  id INTEGER NOT NULL,
  departmentCode VARCHAR(32),
  locationName VARCHAR(32),
  patientVolume INTEGER,
  averageWaitTime DECIMAL,
  staffingLevel INTEGER,
  operationalStatus VARCHAR(32),
  systemId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (systemId) REFERENCES HealthInformationTechnologySystem (id)
);

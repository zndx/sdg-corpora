CREATE TABLE HospitalManager (
  id INTEGER NOT NULL,
  managerID VARCHAR(32),
  departmentAssigned VARCHAR(32),
  yearsInRole INTEGER,
  focusArea VARCHAR(32),
  departmentId INTEGER,
  systemId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (departmentId) REFERENCES EmergencyDepartment (id),
  FOREIGN KEY (systemId) REFERENCES HealthInformationTechnologySystem (id)
);

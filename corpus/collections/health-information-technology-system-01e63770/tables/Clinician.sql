CREATE TABLE Clinician (
  clinicianId INTEGER NOT NULL,
  clinicianID VARCHAR(32),
  specialty VARCHAR(32),
  yearsOfExperience INTEGER,
  moraleLevel DECIMAL,
  productivityMetric DECIMAL,
  isCertified BOOLEAN,
  departmentId INTEGER,
  systemId INTEGER,
  managerId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (clinicianId),
  FOREIGN KEY (departmentId) REFERENCES EmergencyDepartment (id),
  FOREIGN KEY (systemId) REFERENCES HealthInformationTechnologySystem (id),
  FOREIGN KEY (managerId) REFERENCES HospitalManager (id)
);

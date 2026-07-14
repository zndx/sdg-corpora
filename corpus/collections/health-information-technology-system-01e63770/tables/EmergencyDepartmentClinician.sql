CREATE TABLE EmergencyDepartmentClinician (
  departmentId INTEGER NOT NULL,
  clinicianId INTEGER NOT NULL,
  PRIMARY KEY (departmentId, clinicianId),
  FOREIGN KEY (departmentId) REFERENCES EmergencyDepartment (id),
  FOREIGN KEY (clinicianId) REFERENCES Clinician (clinicianId)
);

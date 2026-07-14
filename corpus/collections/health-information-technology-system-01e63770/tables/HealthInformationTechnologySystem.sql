CREATE TABLE HealthInformationTechnologySystem (
  id INTEGER NOT NULL,
  systemIdentifier VARCHAR(32),
  systemName VARCHAR(32),
  deploymentDate TIMESTAMP,
  systemType VARCHAR(32),
  usabilityScore DECIMAL,
  interoperabilityStandard VARCHAR(32),
  isStandardized BOOLEAN,
  departmentId INTEGER,
  clinicianId INTEGER,
  participantId INTEGER,
  assessmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (departmentId) REFERENCES EmergencyDepartment (id),
  FOREIGN KEY (clinicianId) REFERENCES Clinician (clinicianId),
  FOREIGN KEY (participantId) REFERENCES ITParticipant (id),
  FOREIGN KEY (assessmentId) REFERENCES UsabilityAssessment (assessmentId)
);

CREATE TABLE ITParticipant (
  id INTEGER NOT NULL,
  participantID VARCHAR(32),
  skillLevel VARCHAR(32),
  roleInProject VARCHAR(32),
  affiliatedOrganization VARCHAR(39),
  systemId INTEGER,
  assessmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (systemId) REFERENCES HealthInformationTechnologySystem (id),
  FOREIGN KEY (assessmentId) REFERENCES UsabilityAssessment (assessmentId)
);

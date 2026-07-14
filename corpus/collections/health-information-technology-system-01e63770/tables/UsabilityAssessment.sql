CREATE TABLE UsabilityAssessment (
  assessmentId INTEGER NOT NULL,
  assessmentID VARCHAR(32),
  assessmentDate TIMESTAMP,
  score DECIMAL,
  testSubjectGroup VARCHAR(32),
  isCompleted BOOLEAN,
  systemId INTEGER,
  participantId INTEGER,
  PRIMARY KEY (assessmentId),
  FOREIGN KEY (systemId) REFERENCES HealthInformationTechnologySystem (id),
  FOREIGN KEY (participantId) REFERENCES ITParticipant (id)
);

CREATE TABLE JointAssessmentMechanism (
  id INTEGER NOT NULL,
  mechanismID VARCHAR(32),
  mechanismName VARCHAR(32),
  activationDate TIMESTAMP,
  investigationOutcome VARCHAR(32),
  resourcesAllocated DECIMAL,
  participatingAgencies VARCHAR(32),
  eventId INTEGER,
  mechanismId INTEGER,
  facilityID VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (eventId) REFERENCES BiologicalEvent (eventId),
  FOREIGN KEY (mechanismId) REFERENCES CatalyticFinancingMechanism (mechanismId),
  FOREIGN KEY (facilityID) REFERENCES ResearchFacility (facilityID)
);

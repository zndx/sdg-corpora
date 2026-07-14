CREATE TABLE InfrastructurePhaseInspectionEvent (
  phaseId INTEGER NOT NULL,
  eventId INTEGER NOT NULL,
  PRIMARY KEY (phaseId, eventId),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (eventId) REFERENCES InspectionEvent (id)
);

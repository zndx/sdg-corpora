CREATE TABLE Deficiency (
  deficiencyId VARCHAR(32) NOT NULL,
  description VARCHAR(32),
  severity VARCHAR(32),
  identifiedDate TIMESTAMP,
  correctedDate TIMESTAMP,
  status VARCHAR(32),
  requiresReInspection BOOLEAN,
  eventId INTEGER,
  contractorId INTEGER,
  verifiedByEventId INTEGER,
  PRIMARY KEY (deficiencyId),
  FOREIGN KEY (eventId) REFERENCES InspectionEvent (id),
  FOREIGN KEY (contractorId) REFERENCES Contractor (id),
  FOREIGN KEY (verifiedByEventId) REFERENCES InspectionEvent (id)
);

CREATE TABLE TestSheet (
  testSheetId VARCHAR(44) NOT NULL,
  testType VARCHAR(32),
  testDate TIMESTAMP,
  resultStatus VARCHAR(32),
  approvedBy VARCHAR(32),
  approvalDate TIMESTAMP,
  testSpecification VARCHAR(32),
  isElectronic BOOLEAN,
  phaseId INTEGER,
  eventId INTEGER,
  regulationId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (testSheetId),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (eventId) REFERENCES InspectionEvent (id),
  FOREIGN KEY (regulationId) REFERENCES Regulation (id)
);

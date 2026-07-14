CREATE TABLE Developer (
  developerId VARCHAR(32) NOT NULL,
  developerName VARCHAR(32),
  contactEmail VARCHAR(32),
  representativeName VARCHAR(32),
  phaseId INTEGER,
  contractorId INTEGER,
  drawingId INTEGER,
  PRIMARY KEY (developerId),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (contractorId) REFERENCES Contractor (id),
  FOREIGN KEY (drawingId) REFERENCES Drawing (id)
);

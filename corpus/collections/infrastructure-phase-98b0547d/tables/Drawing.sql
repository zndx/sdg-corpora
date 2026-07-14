CREATE TABLE Drawing (
  id INTEGER NOT NULL,
  drawingId VARCHAR(44),
  drawingType VARCHAR(32),
  submissionDate TIMESTAMP,
  format VARCHAR(32),
  status VARCHAR(32),
  fileSize DECIMAL,
  isElectronic BOOLEAN,
  phaseId INTEGER,
  regulationId INTEGER,
  referencesPhaseId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (phaseId) REFERENCES InfrastructurePhase (phaseId),
  FOREIGN KEY (regulationId) REFERENCES Regulation (id),
  FOREIGN KEY (referencesPhaseId) REFERENCES InfrastructurePhase (phaseId)
);

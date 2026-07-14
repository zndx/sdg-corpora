CREATE TABLE InfrastructurePhase (
  phaseId INTEGER NOT NULL,
  phaseIdentifier VARCHAR(32),
  phaseName VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  status VARCHAR(32),
  isGuaranteed BOOLEAN,
  PRIMARY KEY (phaseId)
);

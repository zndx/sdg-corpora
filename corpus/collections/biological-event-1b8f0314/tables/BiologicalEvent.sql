CREATE TABLE BiologicalEvent (
  eventId INTEGER NOT NULL,
  eventIdentifier VARCHAR(32),
  pathogenName VARCHAR(32),
  infectionCount INTEGER,
  mortalityCount INTEGER,
  economicLossUSD DECIMAL,
  onsetDate TIMESTAMP,
  status VARCHAR(32),
  mechanismId INTEGER,
  advancementId INTEGER,
  fundedByMechanismId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (eventId),
  FOREIGN KEY (mechanismId) REFERENCES JointAssessmentMechanism (id),
  FOREIGN KEY (advancementId) REFERENCES BioscienceAdvancement (id),
  FOREIGN KEY (fundedByMechanismId) REFERENCES CatalyticFinancingMechanism (mechanismId)
);

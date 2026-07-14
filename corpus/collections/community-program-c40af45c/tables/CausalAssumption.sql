CREATE TABLE CausalAssumption (
  assumptionId INTEGER NOT NULL,
  assumptionIdentifier VARCHAR(32),
  assumptionText VARCHAR(32),
  confidenceLevel VARCHAR(32),
  isVerified BOOLEAN,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (assumptionId)
);

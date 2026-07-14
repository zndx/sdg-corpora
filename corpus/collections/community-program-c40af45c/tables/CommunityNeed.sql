CREATE TABLE CommunityNeed (
  needId INTEGER NOT NULL,
  needIdentifier VARCHAR(32),
  needDescription VARCHAR(32),
  severityLevel VARCHAR(32),
  targetPopulation VARCHAR(32),
  geographicScope VARCHAR(32),
  PRIMARY KEY (needId)
);

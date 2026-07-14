CREATE TABLE InteroperabilityStandard (
  id INTEGER NOT NULL,
  standardId INTEGER,
  standardName VARCHAR(32),
  version VARCHAR(32),
  technologyType VARCHAR(37),
  complianceLevel VARCHAR(32),
  effectiveDate DATE,
  boardId INTEGER,
  environmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id),
  FOREIGN KEY (environmentId) REFERENCES InformationEnvironment (id)
);

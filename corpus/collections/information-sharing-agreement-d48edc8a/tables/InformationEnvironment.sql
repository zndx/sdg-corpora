CREATE TABLE InformationEnvironment (
  id INTEGER NOT NULL,
  environmentId INTEGER,
  environmentName VARCHAR(44),
  architectureType VARCHAR(37),
  operationalStatus VARCHAR(32),
  visibilityLevel VARCHAR(32),
  boardId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id)
);

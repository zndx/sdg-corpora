CREATE TABLE GovernanceBoard (
  id INTEGER NOT NULL,
  boardId VARCHAR(35),
  establishmentDate DATE,
  governanceScope VARCHAR(43),
  meetingFrequency VARCHAR(32),
  decisionAuthority VARCHAR(32),
  environmentId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (environmentId) REFERENCES InformationEnvironment (id)
);

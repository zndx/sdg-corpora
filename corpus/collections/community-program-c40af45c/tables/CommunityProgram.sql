CREATE TABLE CommunityProgram (
  id INTEGER NOT NULL,
  programIdentifier VARCHAR(32),
  programName VARCHAR(32),
  startDate TIMESTAMP,
  endDate TIMESTAMP,
  status VARCHAR(32),
  scope VARCHAR(32),
  modelId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id)
);

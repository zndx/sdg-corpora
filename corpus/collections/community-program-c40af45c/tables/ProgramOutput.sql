CREATE TABLE ProgramOutput (
  id INTEGER NOT NULL,
  outputIdentifier VARCHAR(32),
  outputName VARCHAR(32),
  outputType VARCHAR(32),
  value DECIMAL,
  measurementDate TIMESTAMP,
  targetValue DECIMAL,
  activityId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId)
);

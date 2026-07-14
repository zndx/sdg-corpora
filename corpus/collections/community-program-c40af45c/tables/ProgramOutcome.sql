CREATE TABLE ProgramOutcome (
  id INTEGER NOT NULL,
  outcomeIdentifier VARCHAR(32),
  outcomeDescription VARCHAR(32),
  timeHorizon VARCHAR(32),
  changeDirection VARCHAR(32),
  targetLevel VARCHAR(32),
  measurableValue DECIMAL,
  measurementDate TIMESTAMP,
  programId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id)
);

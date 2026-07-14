CREATE TABLE ProgramInput (
  id INTEGER NOT NULL,
  inputIdentifier VARCHAR(32),
  inputName VARCHAR(32),
  resourceType VARCHAR(32),
  quantity DECIMAL,
  cost DECIMAL,
  acquisitionDate TIMESTAMP,
  programId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id)
);

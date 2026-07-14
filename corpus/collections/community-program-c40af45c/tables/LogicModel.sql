CREATE TABLE LogicModel (
  id INTEGER NOT NULL,
  modelIdentifier VARCHAR(32),
  layoutOrientation VARCHAR(32),
  creationDate TIMESTAMP,
  isVerified BOOLEAN,
  isExplicit BOOLEAN,
  isMeaningful BOOLEAN,
  programId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id)
);

CREATE TABLE Intuition (
  id INTEGER NOT NULL,
  intuitionType VARCHAR(32),
  isSensible BOOLEAN,
  isPossible BOOLEAN,
  amplifiesConcept VARCHAR(32),
  conceptId INTEGER,
  judgementId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (judgementId) REFERENCES SyntheticAPrioriJudgement (id)
);

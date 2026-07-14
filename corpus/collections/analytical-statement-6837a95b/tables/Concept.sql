CREATE TABLE Concept (
  conceptId INTEGER NOT NULL,
  conceptName VARCHAR(32),
  isIncoherent BOOLEAN,
  isConstructible BOOLEAN,
  domain VARCHAR(32),
  containsConceptId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (conceptId),
  FOREIGN KEY (containsConceptId) REFERENCES Concept (conceptId)
);

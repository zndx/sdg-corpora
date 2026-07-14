CREATE TABLE MathematicalStatement (
  id INTEGER NOT NULL,
  statementText VARCHAR(32),
  isNecessary BOOLEAN,
  isUniversal BOOLEAN,
  requiresConstruction BOOLEAN,
  proofMethod VARCHAR(32),
  conceptId INTEGER,
  hasPredicateConceptConceptId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (hasPredicateConceptConceptId) REFERENCES Concept (conceptId)
);

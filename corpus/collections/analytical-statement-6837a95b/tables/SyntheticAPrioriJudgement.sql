CREATE TABLE SyntheticAPrioriJudgement (
  id INTEGER NOT NULL,
  judgementText VARCHAR(32),
  isNecessary BOOLEAN,
  isUniversal BOOLEAN,
  isAmpliative BOOLEAN,
  requiresIntuition BOOLEAN,
  proofMethod VARCHAR(32),
  conceptId INTEGER,
  hasPredicateConceptConceptId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (hasPredicateConceptConceptId) REFERENCES Concept (conceptId)
);

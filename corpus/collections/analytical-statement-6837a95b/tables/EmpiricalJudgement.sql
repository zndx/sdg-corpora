CREATE TABLE EmpiricalJudgement (
  id INTEGER NOT NULL,
  judgementText VARCHAR(32),
  isParticular BOOLEAN,
  isContingent BOOLEAN,
  requiresPerception BOOLEAN,
  observationContext VARCHAR(32),
  conceptId INTEGER,
  hasPredicateConceptConceptId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (hasPredicateConceptConceptId) REFERENCES Concept (conceptId)
);

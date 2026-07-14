CREATE TABLE AnalyticalStatement (
  id INTEGER NOT NULL,
  statementText VARCHAR(32),
  subjectConcept VARCHAR(32),
  predicateConcept VARCHAR(32),
  isContradictory BOOLEAN,
  isExplicative BOOLEAN,
  conceptId INTEGER,
  hasPredicateConceptConceptId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (hasPredicateConceptConceptId) REFERENCES Concept (conceptId)
);

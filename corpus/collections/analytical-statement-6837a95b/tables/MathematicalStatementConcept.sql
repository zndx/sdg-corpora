CREATE TABLE MathematicalStatementConcept (
  statementId INTEGER NOT NULL,
  conceptId INTEGER NOT NULL,
  PRIMARY KEY (statementId, conceptId),
  FOREIGN KEY (statementId) REFERENCES MathematicalStatement (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId)
);

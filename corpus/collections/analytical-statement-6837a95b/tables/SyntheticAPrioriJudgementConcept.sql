CREATE TABLE SyntheticAPrioriJudgementConcept (
  judgementId INTEGER NOT NULL,
  conceptId INTEGER NOT NULL,
  PRIMARY KEY (judgementId, conceptId),
  FOREIGN KEY (judgementId) REFERENCES SyntheticAPrioriJudgement (id),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId)
);

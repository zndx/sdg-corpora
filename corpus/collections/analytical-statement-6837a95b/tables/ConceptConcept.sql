CREATE TABLE ConceptConcept (
  conceptId INTEGER NOT NULL,
  isConstructedFromConceptId INTEGER NOT NULL,
  PRIMARY KEY (conceptId, isConstructedFromConceptId),
  FOREIGN KEY (conceptId) REFERENCES Concept (conceptId),
  FOREIGN KEY (isConstructedFromConceptId) REFERENCES Concept (conceptId)
);

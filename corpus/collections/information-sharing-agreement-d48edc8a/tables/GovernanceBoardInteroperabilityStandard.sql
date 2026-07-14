CREATE TABLE GovernanceBoardInteroperabilityStandard (
  boardId INTEGER NOT NULL,
  standardId INTEGER NOT NULL,
  PRIMARY KEY (boardId, standardId),
  FOREIGN KEY (boardId) REFERENCES GovernanceBoard (id),
  FOREIGN KEY (standardId) REFERENCES InteroperabilityStandard (id)
);

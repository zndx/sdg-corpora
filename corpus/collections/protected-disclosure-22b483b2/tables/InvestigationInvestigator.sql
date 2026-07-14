CREATE TABLE InvestigationInvestigator (
  investigationId INTEGER NOT NULL,
  investigatorId VARCHAR(32) NOT NULL,
  PRIMARY KEY (investigationId, investigatorId),
  FOREIGN KEY (investigationId) REFERENCES Investigation (investigationId),
  FOREIGN KEY (investigatorId) REFERENCES Investigator (investigatorId)
);

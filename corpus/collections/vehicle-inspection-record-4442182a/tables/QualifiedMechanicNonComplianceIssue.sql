CREATE TABLE QualifiedMechanicNonComplianceIssue (
  mechanicId INTEGER NOT NULL,
  issueId INTEGER NOT NULL,
  PRIMARY KEY (mechanicId, issueId),
  FOREIGN KEY (mechanicId) REFERENCES QualifiedMechanic (mechanicId),
  FOREIGN KEY (issueId) REFERENCES NonComplianceIssue (id)
);

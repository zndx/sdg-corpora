CREATE TABLE ITGovernanceProcess (
  id INTEGER NOT NULL,
  processId VARCHAR(44),
  processName VARCHAR(32),
  framework VARCHAR(32),
  maturityLevel INTEGER,
  lastAuditDate DATE,
  complianceStatus VARCHAR(32),
  institutionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (institutionId) REFERENCES HigherEducationInstitution (institutionId)
);

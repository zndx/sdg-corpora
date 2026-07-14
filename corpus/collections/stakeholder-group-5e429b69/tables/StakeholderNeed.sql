CREATE TABLE StakeholderNeed (
  id INTEGER NOT NULL,
  needId VARCHAR(44),
  needDescription VARCHAR(32),
  urgencyLevel VARCHAR(32),
  satisfactionStatus VARCHAR(32),
  lastAssessedDate TIMESTAMP,
  processId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (processId) REFERENCES ITGovernanceProcess (id)
);

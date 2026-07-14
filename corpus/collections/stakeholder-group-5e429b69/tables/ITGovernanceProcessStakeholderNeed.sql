CREATE TABLE ITGovernanceProcessStakeholderNeed (
  processId INTEGER NOT NULL,
  needId INTEGER NOT NULL,
  PRIMARY KEY (processId, needId),
  FOREIGN KEY (processId) REFERENCES ITGovernanceProcess (id),
  FOREIGN KEY (needId) REFERENCES StakeholderNeed (id)
);

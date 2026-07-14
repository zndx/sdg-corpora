CREATE TABLE HigherEducationInstitutionITGovernanceProcess (
  institutionId INTEGER NOT NULL,
  processId INTEGER NOT NULL,
  PRIMARY KEY (institutionId, processId),
  FOREIGN KEY (institutionId) REFERENCES HigherEducationInstitution (institutionId),
  FOREIGN KEY (processId) REFERENCES ITGovernanceProcess (id)
);

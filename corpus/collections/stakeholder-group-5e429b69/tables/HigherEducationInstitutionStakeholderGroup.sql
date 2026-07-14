CREATE TABLE HigherEducationInstitutionStakeholderGroup (
  institutionId INTEGER NOT NULL,
  groupId INTEGER NOT NULL,
  PRIMARY KEY (institutionId, groupId),
  FOREIGN KEY (institutionId) REFERENCES HigherEducationInstitution (institutionId),
  FOREIGN KEY (groupId) REFERENCES StakeholderGroup (groupId)
);

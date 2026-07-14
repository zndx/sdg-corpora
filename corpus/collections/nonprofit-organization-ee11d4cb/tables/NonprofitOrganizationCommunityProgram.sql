CREATE TABLE NonprofitOrganizationCommunityProgram (
  organizationId INTEGER NOT NULL,
  programId INTEGER NOT NULL,
  PRIMARY KEY (organizationId, programId),
  FOREIGN KEY (organizationId) REFERENCES NonprofitOrganization (organizationId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (programId)
);

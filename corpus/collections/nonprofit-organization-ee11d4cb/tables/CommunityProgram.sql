CREATE TABLE CommunityProgram (
  programId INTEGER NOT NULL,
  programName VARCHAR(32),
  targetAgeRange VARCHAR(32),
  totalParticipants INTEGER,
  programDurationYears INTEGER,
  primaryFocusArea VARCHAR(32),
  evidenceBasedStatus VARCHAR(32),
  organizationId INTEGER,
  institutionId INTEGER,
  curriculumId INTEGER,
  PRIMARY KEY (programId),
  FOREIGN KEY (organizationId) REFERENCES NonprofitOrganization (organizationId),
  FOREIGN KEY (institutionId) REFERENCES ResearchInstitution (id),
  FOREIGN KEY (curriculumId) REFERENCES EducationalCurriculum (curriculumId)
);

CREATE TABLE GovernmentAgency (
  agencyId INTEGER NOT NULL,
  agencyName VARCHAR(37),
  jurisdictionLevel VARCHAR(32),
  approvalGranted BOOLEAN,
  grantReviewRole VARCHAR(32),
  curriculumId INTEGER,
  programId INTEGER,
  personId INTEGER,
  createdAt TIMESTAMP,
  PRIMARY KEY (agencyId),
  FOREIGN KEY (curriculumId) REFERENCES EducationalCurriculum (curriculumId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (programId),
  FOREIGN KEY (personId) REFERENCES Person (personId)
);

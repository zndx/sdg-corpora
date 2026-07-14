CREATE TABLE EducationalCurriculum (
  curriculumId INTEGER NOT NULL,
  curriculumTitle VARCHAR(32),
  totalSessions INTEGER,
  pedagogicalApproach VARCHAR(32),
  approvalAgency VARCHAR(32),
  approvalStatus VARCHAR(32),
  personId INTEGER,
  institutionId INTEGER,
  PRIMARY KEY (curriculumId),
  FOREIGN KEY (personId) REFERENCES Person (personId),
  FOREIGN KEY (institutionId) REFERENCES ResearchInstitution (id)
);

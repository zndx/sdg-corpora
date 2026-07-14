CREATE TABLE ResearchInstitution (
  id INTEGER NOT NULL,
  institutionName VARCHAR(32),
  evaluationStatus VARCHAR(32),
  evaluationOutcome VARCHAR(32),
  hostingInstitute VARCHAR(32),
  programId INTEGER,
  curriculumId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (programId),
  FOREIGN KEY (curriculumId) REFERENCES EducationalCurriculum (curriculumId)
);

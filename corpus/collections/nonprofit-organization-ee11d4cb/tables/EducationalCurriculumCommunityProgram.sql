CREATE TABLE EducationalCurriculumCommunityProgram (
  curriculumId INTEGER NOT NULL,
  programId INTEGER NOT NULL,
  PRIMARY KEY (curriculumId, programId),
  FOREIGN KEY (curriculumId) REFERENCES EducationalCurriculum (curriculumId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (programId)
);

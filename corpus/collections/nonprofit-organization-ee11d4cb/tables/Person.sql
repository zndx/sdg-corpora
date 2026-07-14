CREATE TABLE Person (
  personId INTEGER NOT NULL,
  fullName VARCHAR(36),
  birthPlace VARCHAR(32),
  highestDegree VARCHAR(32),
  degreeField VARCHAR(32),
  professionalRole VARCHAR(32),
  yearsOfExperience INTEGER,
  organizationId INTEGER,
  curriculumId INTEGER,
  agencyId INTEGER,
  PRIMARY KEY (personId),
  FOREIGN KEY (organizationId) REFERENCES NonprofitOrganization (organizationId),
  FOREIGN KEY (curriculumId) REFERENCES EducationalCurriculum (curriculumId),
  FOREIGN KEY (agencyId) REFERENCES GovernmentAgency (agencyId)
);

CREATE TABLE DoctoralSchoolResearchLaboratory (
  schoolId INTEGER NOT NULL,
  laboratoryId INTEGER NOT NULL,
  PRIMARY KEY (schoolId, laboratoryId),
  FOREIGN KEY (schoolId) REFERENCES DoctoralSchool (id),
  FOREIGN KEY (laboratoryId) REFERENCES ResearchLaboratory (laboratoryId)
);

CREATE TABLE ResearchLaboratory (
  laboratoryId INTEGER NOT NULL,
  laboratoryIdentifier VARCHAR(32),
  laboratoryName VARCHAR(32),
  researchDomain VARCHAR(32),
  operationalStatus VARCHAR(32),
  schoolId INTEGER,
  executiveDepartmentCode VARCHAR(32),
  PRIMARY KEY (laboratoryId),
  FOREIGN KEY (schoolId) REFERENCES DoctoralSchool (id),
  FOREIGN KEY (executiveDepartmentCode) REFERENCES ResearchExecutive (departmentCode)
);

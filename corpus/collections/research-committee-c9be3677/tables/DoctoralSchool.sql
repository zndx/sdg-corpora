CREATE TABLE DoctoralSchool (
  id INTEGER NOT NULL,
  schoolCode VARCHAR(44),
  schoolName VARCHAR(32),
  academicFocus VARCHAR(32),
  memberLaboratoryCount INTEGER,
  jurisdictionalScope VARCHAR(32),
  executiveDepartmentCode VARCHAR(32),
  collegeId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (executiveDepartmentCode) REFERENCES ResearchExecutive (departmentCode),
  FOREIGN KEY (collegeId) REFERENCES DoctoralCollege (id)
);

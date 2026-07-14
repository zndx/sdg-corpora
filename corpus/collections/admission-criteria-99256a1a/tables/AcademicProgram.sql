CREATE TABLE AcademicProgram (
  programId INTEGER NOT NULL,
  programName VARCHAR(32),
  degreeLevel VARCHAR(32),
  departmentId VARCHAR(32),
  status VARCHAR(32),
  totalCreditsRequired INTEGER,
  criteriaId INTEGER,
  offeredByDepartmentId VARCHAR(32),
  PRIMARY KEY (programId),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id),
  FOREIGN KEY (offeredByDepartmentId) REFERENCES Department (departmentId)
);

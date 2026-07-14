CREATE TABLE DepartmentAcademicProgram (
  departmentId VARCHAR(32) NOT NULL,
  programId INTEGER NOT NULL,
  PRIMARY KEY (departmentId, programId),
  FOREIGN KEY (departmentId) REFERENCES Department (departmentId),
  FOREIGN KEY (programId) REFERENCES AcademicProgram (programId)
);

CREATE TABLE PrerequisiteCourse (
  id INTEGER NOT NULL,
  courseCode VARCHAR(32),
  courseTitle VARCHAR(32),
  credits INTEGER,
  departmentId VARCHAR(32),
  status VARCHAR(32),
  criteriaId INTEGER,
  offeredByDepartmentId VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id),
  FOREIGN KEY (offeredByDepartmentId) REFERENCES Department (departmentId)
);

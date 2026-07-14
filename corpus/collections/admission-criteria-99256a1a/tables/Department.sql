CREATE TABLE Department (
  departmentId VARCHAR(32) NOT NULL,
  departmentName VARCHAR(32),
  collegeId VARCHAR(32),
  chairpersonName VARCHAR(32),
  status VARCHAR(32),
  criteriaId INTEGER,
  PRIMARY KEY (departmentId),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id)
);

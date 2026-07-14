CREATE TABLE Department (
  departmentId INTEGER NOT NULL,
  deptId VARCHAR(32),
  deptName VARCHAR(32),
  headCount INTEGER,
  budget DECIMAL,
  isSharedService BOOLEAN,
  operationalStatus VARCHAR(32),
  executiveId INTEGER,
  brandId VARCHAR(32),
  collaboratesWithDepartmentId INTEGER,
  PRIMARY KEY (departmentId),
  FOREIGN KEY (executiveId) REFERENCES Executive (executiveId),
  FOREIGN KEY (brandId) REFERENCES Brand (brandId),
  FOREIGN KEY (collaboratesWithDepartmentId) REFERENCES Department (departmentId)
);

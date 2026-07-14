CREATE TABLE DepartmentPrerequisiteCourse (
  departmentId VARCHAR(32) NOT NULL,
  courseId INTEGER NOT NULL,
  PRIMARY KEY (departmentId, courseId),
  FOREIGN KEY (departmentId) REFERENCES Department (departmentId),
  FOREIGN KEY (courseId) REFERENCES PrerequisiteCourse (id)
);

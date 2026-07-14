CREATE TABLE AdmissionCriteriaPrerequisiteCourse (
  criteriaId INTEGER NOT NULL,
  courseId INTEGER NOT NULL,
  PRIMARY KEY (criteriaId, courseId),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id),
  FOREIGN KEY (courseId) REFERENCES PrerequisiteCourse (id)
);

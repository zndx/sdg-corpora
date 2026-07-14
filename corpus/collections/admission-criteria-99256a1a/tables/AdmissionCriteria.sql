CREATE TABLE AdmissionCriteria (
  id INTEGER NOT NULL,
  criteriaId VARCHAR(44),
  effectiveDate DATE,
  minimumGPA DECIMAL,
  status VARCHAR(32),
  description VARCHAR(32),
  programId INTEGER,
  examId INTEGER,
  requirementId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (programId) REFERENCES AcademicProgram (programId),
  FOREIGN KEY (examId) REFERENCES StandardizedExam (id),
  FOREIGN KEY (requirementId) REFERENCES ExperientialRequirement (id)
);

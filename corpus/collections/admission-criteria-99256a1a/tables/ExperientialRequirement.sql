CREATE TABLE ExperientialRequirement (
  id INTEGER NOT NULL,
  requirementId VARCHAR(38),
  description VARCHAR(32),
  minimumHours INTEGER,
  verificationMethod VARCHAR(32),
  status VARCHAR(32),
  criteriaId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id)
);

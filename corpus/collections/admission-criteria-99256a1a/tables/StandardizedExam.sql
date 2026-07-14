CREATE TABLE StandardizedExam (
  id INTEGER NOT NULL,
  examCode VARCHAR(44),
  examName VARCHAR(32),
  status VARCHAR(32),
  administeredBy VARCHAR(32),
  lastUsedDate DATE,
  criteriaId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (criteriaId) REFERENCES AdmissionCriteria (id)
);

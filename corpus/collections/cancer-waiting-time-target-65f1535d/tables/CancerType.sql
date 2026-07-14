CREATE TABLE CancerType (
  id INTEGER NOT NULL,
  cancerTypeName VARCHAR(32),
  icd10Code VARCHAR(44),
  isPrimaryCancer BOOLEAN,
  targetId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (targetId) REFERENCES CancerWaitingTimeTarget (targetId)
);

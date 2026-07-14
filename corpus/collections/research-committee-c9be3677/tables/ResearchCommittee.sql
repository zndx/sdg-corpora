CREATE TABLE ResearchCommittee (
  committeeId INTEGER NOT NULL,
  committeeIdentifier VARCHAR(32),
  establishedDate DATE,
  governanceStatus VARCHAR(32),
  executiveDepartmentCode VARCHAR(32),
  laboratoryId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (committeeId),
  FOREIGN KEY (executiveDepartmentCode) REFERENCES ResearchExecutive (departmentCode),
  FOREIGN KEY (laboratoryId) REFERENCES ResearchLaboratory (laboratoryId)
);

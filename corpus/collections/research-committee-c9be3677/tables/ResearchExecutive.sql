CREATE TABLE ResearchExecutive (
  executiveIdentifier VARCHAR(32),
  fullLegalName VARCHAR(32),
  appointmentDate DATE,
  departmentCode VARCHAR(32) NOT NULL,
  committeeId INTEGER,
  laboratoryId INTEGER,
  PRIMARY KEY (departmentCode),
  FOREIGN KEY (committeeId) REFERENCES ResearchCommittee (committeeId),
  FOREIGN KEY (laboratoryId) REFERENCES ResearchLaboratory (laboratoryId)
);

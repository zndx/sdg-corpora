CREATE TABLE Application (
  id INTEGER NOT NULL,
  applicationId VARCHAR(32),
  submissionDate TIMESTAMP,
  status VARCHAR(32),
  applicationType VARCHAR(32),
  processingOffice VARCHAR(32),
  personId INTEGER,
  applicantId INTEGER,
  positionId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (personId) REFERENCES RegulatedPerson (id),
  FOREIGN KEY (applicantId) REFERENCES Applicant (applicantId),
  FOREIGN KEY (positionId) REFERENCES RegulatedPosition (positionId)
);

CREATE TABLE RegulatedPosition (
  positionId INTEGER NOT NULL,
  positionTitle VARCHAR(32),
  proposedStartDate DATE,
  isMoneyLaunderingReportingOfficer BOOLEAN,
  employmentType VARCHAR(32),
  applicantId INTEGER,
  personId INTEGER,
  PRIMARY KEY (positionId),
  FOREIGN KEY (applicantId) REFERENCES Applicant (applicantId),
  FOREIGN KEY (personId) REFERENCES RegulatedPerson (id)
);

CREATE TABLE RegulatedPerson (
  id INTEGER NOT NULL,
  certificateNumber VARCHAR(32),
  legalName VARCHAR(32),
  registeredAddress VARCHAR(32),
  status VARCHAR(32),
  registrationDate DATE,
  applicantId INTEGER,
  applicationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applicantId) REFERENCES Applicant (applicantId),
  FOREIGN KEY (applicationId) REFERENCES Application (id)
);

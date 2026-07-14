CREATE TABLE Qualification (
  id INTEGER NOT NULL,
  institutionName VARCHAR(32),
  qualificationType VARCHAR(32),
  completionDate DATE,
  applicantId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (applicantId) REFERENCES Applicant (applicantId)
);

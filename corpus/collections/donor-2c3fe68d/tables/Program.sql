CREATE TABLE Program (
  id INTEGER NOT NULL,
  programIdentifier VARCHAR(32),
  programName VARCHAR(32),
  programType VARCHAR(32),
  donationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (donationId) REFERENCES Donation (donationId)
);

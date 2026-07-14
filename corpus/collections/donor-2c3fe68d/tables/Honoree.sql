CREATE TABLE Honoree (
  id INTEGER NOT NULL,
  honoreeName VARCHAR(32),
  honoreeType VARCHAR(32),
  donationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (donationId) REFERENCES Donation (donationId)
);

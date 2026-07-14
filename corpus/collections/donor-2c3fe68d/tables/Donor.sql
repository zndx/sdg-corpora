CREATE TABLE Donor (
  donorIdentifier VARCHAR(32),
  donorName VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zipCode VARCHAR(44) NOT NULL,
  emailAddress VARCHAR(32),
  isAnonymous BOOLEAN,
  donationId INTEGER,
  requestId INTEGER,
  PRIMARY KEY (zipCode),
  FOREIGN KEY (donationId) REFERENCES Donation (donationId),
  FOREIGN KEY (requestId) REFERENCES ContactRequest (id)
);

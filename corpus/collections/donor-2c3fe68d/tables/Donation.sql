CREATE TABLE Donation (
  donationId INTEGER NOT NULL,
  donationIdentifier VARCHAR(32),
  amount DECIMAL,
  donationDate DATE,
  isMemorial BOOLEAN,
  isHonor BOOLEAN,
  isDeferred BOOLEAN,
  donorZipCode VARCHAR(44),
  programId INTEGER,
  honoreeId INTEGER,
  recipientId INTEGER,
  PRIMARY KEY (donationId),
  FOREIGN KEY (donorZipCode) REFERENCES Donor (zipCode),
  FOREIGN KEY (programId) REFERENCES Program (id),
  FOREIGN KEY (honoreeId) REFERENCES Honoree (id),
  FOREIGN KEY (recipientId) REFERENCES ContactRecipient (id)
);

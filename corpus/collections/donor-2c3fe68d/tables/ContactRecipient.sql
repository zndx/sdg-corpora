CREATE TABLE ContactRecipient (
  id INTEGER NOT NULL,
  recipientName VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zipCode VARCHAR(44),
  relationship VARCHAR(32),
  donationId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (donationId) REFERENCES Donation (donationId)
);

CREATE TABLE ContactRequest (
  id INTEGER NOT NULL,
  requestIdentifier VARCHAR(32),
  requestType VARCHAR(32),
  isRequested BOOLEAN,
  donorZipCode VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (donorZipCode) REFERENCES Donor (zipCode)
);

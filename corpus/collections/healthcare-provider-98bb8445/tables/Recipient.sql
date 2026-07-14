CREATE TABLE Recipient (
  id INTEGER NOT NULL,
  recipientId VARCHAR(40),
  recipientName VARCHAR(32),
  relationshipType VARCHAR(32),
  trustLevel VARCHAR(32),
  patientId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patientId) REFERENCES Patient (id)
);

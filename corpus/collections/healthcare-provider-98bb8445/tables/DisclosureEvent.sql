CREATE TABLE DisclosureEvent (
  id INTEGER NOT NULL,
  eventId VARCHAR(44),
  disclosureDate TIMESTAMP,
  disclosureMethod VARCHAR(32),
  disclosureOutcome VARCHAR(32),
  patientId INTEGER,
  recipientId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patientId) REFERENCES Patient (id),
  FOREIGN KEY (recipientId) REFERENCES Recipient (id)
);

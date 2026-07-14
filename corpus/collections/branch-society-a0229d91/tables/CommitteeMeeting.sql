CREATE TABLE CommitteeMeeting (
  meetingId INTEGER NOT NULL,
  meetingDate TIMESTAMP,
  startTime VARCHAR(32),
  durationHours DECIMAL,
  agenda VARCHAR(32),
  status VARCHAR(32),
  committeeCode VARCHAR(44),
  locationId INTEGER,
  PRIMARY KEY (meetingId),
  FOREIGN KEY (committeeCode) REFERENCES Committee (committeeCode),
  FOREIGN KEY (locationId) REFERENCES Location (id)
);

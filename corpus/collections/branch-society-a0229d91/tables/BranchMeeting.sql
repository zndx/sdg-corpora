CREATE TABLE BranchMeeting (
  meetingId INTEGER NOT NULL,
  meetingDate TIMESTAMP,
  startTime VARCHAR(32),
  durationHours DECIMAL,
  location VARCHAR(32),
  topic VARCHAR(32),
  status VARCHAR(32),
  societyId INTEGER,
  physicianId INTEGER,
  PRIMARY KEY (meetingId),
  FOREIGN KEY (societyId) REFERENCES BranchSociety (societyId),
  FOREIGN KEY (physicianId) REFERENCES Physician (physicianId)
);

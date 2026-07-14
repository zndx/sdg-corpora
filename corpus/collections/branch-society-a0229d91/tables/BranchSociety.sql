CREATE TABLE BranchSociety (
  societyId INTEGER NOT NULL,
  branchCode VARCHAR(32),
  geographicArea VARCHAR(32),
  meetingFrequency INTEGER,
  primaryAddress VARCHAR(32),
  meetingId INTEGER,
  physicianId INTEGER,
  PRIMARY KEY (societyId),
  FOREIGN KEY (meetingId) REFERENCES BranchMeeting (meetingId),
  FOREIGN KEY (physicianId) REFERENCES Physician (physicianId)
);

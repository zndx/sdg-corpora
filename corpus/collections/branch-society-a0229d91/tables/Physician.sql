CREATE TABLE Physician (
  physicianId INTEGER NOT NULL,
  physicianID VARCHAR(32),
  fullName VARCHAR(36),
  age INTEGER,
  yearsInPractice INTEGER,
  primaryAddress VARCHAR(32),
  membershipStatus VARCHAR(32),
  societyId INTEGER,
  meetingId INTEGER,
  committeeCode VARCHAR(44),
  PRIMARY KEY (physicianId),
  FOREIGN KEY (societyId) REFERENCES BranchSociety (societyId),
  FOREIGN KEY (meetingId) REFERENCES BranchMeeting (meetingId),
  FOREIGN KEY (committeeCode) REFERENCES Committee (committeeCode)
);

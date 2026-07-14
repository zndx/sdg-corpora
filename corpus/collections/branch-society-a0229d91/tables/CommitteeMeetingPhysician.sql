CREATE TABLE CommitteeMeetingPhysician (
  meetingId INTEGER NOT NULL,
  physicianId INTEGER NOT NULL,
  PRIMARY KEY (meetingId, physicianId),
  FOREIGN KEY (meetingId) REFERENCES CommitteeMeeting (meetingId),
  FOREIGN KEY (physicianId) REFERENCES Physician (physicianId)
);

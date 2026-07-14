CREATE TABLE Location (
  id INTEGER NOT NULL,
  locationID VARCHAR(32),
  address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  venueType VARCHAR(32),
  meetingId INTEGER,
  hostsMeetingMeetingId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (meetingId) REFERENCES BranchMeeting (meetingId),
  FOREIGN KEY (hostsMeetingMeetingId) REFERENCES CommitteeMeeting (meetingId)
);

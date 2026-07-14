CREATE TABLE BoardOfAssessors (
  id INTEGER NOT NULL,
  boardIdentifier VARCHAR(32),
  jurisdiction VARCHAR(32),
  establishedDate DATE,
  currentSession VARCHAR(32),
  meetingId INTEGER,
  appraiserId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (meetingId) REFERENCES BoardMeeting (id),
  FOREIGN KEY (appraiserId) REFERENCES ChiefAppraiser (appraiserId)
);

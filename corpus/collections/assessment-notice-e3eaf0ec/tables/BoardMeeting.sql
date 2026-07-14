CREATE TABLE BoardMeeting (
  id INTEGER NOT NULL,
  meetingIdentifier VARCHAR(32),
  meetingDate TIMESTAMP,
  meetingType VARCHAR(32),
  status VARCHAR(32),
  quorumPresent BOOLEAN,
  noticeId INTEGER,
  exemptionId INTEGER,
  assessorsId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (noticeId) REFERENCES AssessmentNotice (id),
  FOREIGN KEY (exemptionId) REFERENCES PropertyExemption (exemptionId),
  FOREIGN KEY (assessorsId) REFERENCES BoardOfAssessors (id)
);

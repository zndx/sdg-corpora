CREATE TABLE meetings_legislators (
  meeting_id VARCHAR(44) NOT NULL,
  legislator_id INTEGER NOT NULL,
  PRIMARY KEY (meeting_id, legislator_id),
  FOREIGN KEY (meeting_id) REFERENCES committee_meetings (meeting_id),
  FOREIGN KEY (legislator_id) REFERENCES legislators (id)
);

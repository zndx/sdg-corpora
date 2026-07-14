CREATE TABLE meetings_shareholders (
  annual_general_meeting_id INTEGER NOT NULL,
  shareholder_id INTEGER NOT NULL,
  PRIMARY KEY (annual_general_meeting_id, shareholder_id),
  FOREIGN KEY (annual_general_meeting_id) REFERENCES annual_general_meetings (id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (shareholder_id)
);

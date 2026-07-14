CREATE TABLE meetings_shareholders (
  general_meeting_id INTEGER NOT NULL,
  shareholder_id INTEGER NOT NULL,
  PRIMARY KEY (general_meeting_id, shareholder_id),
  FOREIGN KEY (general_meeting_id) REFERENCES general_meetings (id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (id)
);

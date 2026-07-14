CREATE TABLE committee_meetings (
  meeting_id VARCHAR(44) NOT NULL,
  scheduled_date_time TIMESTAMP,
  duration_minutes INTEGER,
  meeting_type VARCHAR(32),
  status VARCHAR(32),
  legislative_committee_id INTEGER,
  venue_id VARCHAR(40),
  PRIMARY KEY (meeting_id),
  FOREIGN KEY (legislative_committee_id) REFERENCES legislative_committees (id),
  FOREIGN KEY (venue_id) REFERENCES meeting_venues (venue_id)
);

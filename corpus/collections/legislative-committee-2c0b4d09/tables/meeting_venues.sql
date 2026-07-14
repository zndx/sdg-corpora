CREATE TABLE meeting_venues (
  venue_id VARCHAR(40) NOT NULL,
  venue_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  room_number VARCHAR(32),
  meeting_id VARCHAR(44),
  created_at TIMESTAMP,
  PRIMARY KEY (venue_id),
  FOREIGN KEY (meeting_id) REFERENCES committee_meetings (meeting_id)
);

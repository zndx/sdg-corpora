CREATE TABLE legislative_committees (
  id INTEGER NOT NULL,
  committee_id VARCHAR(32),
  committee_name VARCHAR(32),
  jurisdiction_description VARCHAR(32),
  status VARCHAR(32),
  established_date TIMESTAMP,
  venue_id VARCHAR(40),
  PRIMARY KEY (id),
  FOREIGN KEY (venue_id) REFERENCES meeting_venues (venue_id)
);

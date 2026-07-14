CREATE TABLE steering_committees (
  steering_committee_id INTEGER NOT NULL,
  committee_name VARCHAR(32),
  role VARCHAR(32),
  responsibility_level VARCHAR(32),
  academic_conference_id INTEGER,
  PRIMARY KEY (steering_committee_id),
  FOREIGN KEY (academic_conference_id) REFERENCES academic_conferences (id)
);

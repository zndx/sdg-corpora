CREATE TABLE nomination_committees (
  nomination_committee_id INTEGER NOT NULL,
  committee_id VARCHAR(32),
  meeting_date TIMESTAMP,
  min_members INTEGER,
  max_members INTEGER,
  chairman_name VARCHAR(32),
  instructions_adopted BOOLEAN,
  meeting_id VARCHAR(44),
  PRIMARY KEY (nomination_committee_id),
  FOREIGN KEY (meeting_id) REFERENCES annual_general_meetings (meeting_id)
);

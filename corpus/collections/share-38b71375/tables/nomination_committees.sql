CREATE TABLE nomination_committees (
  nomination_committee_id INTEGER NOT NULL,
  committee_id VARCHAR(32),
  charter_version VARCHAR(32),
  min_members INTEGER,
  max_members INTEGER,
  chairman_id VARCHAR(32),
  annual_general_meeting_id INTEGER,
  resolution_id INTEGER,
  PRIMARY KEY (nomination_committee_id),
  FOREIGN KEY (annual_general_meeting_id) REFERENCES annual_general_meetings (id),
  FOREIGN KEY (resolution_id) REFERENCES resolutions (id)
);

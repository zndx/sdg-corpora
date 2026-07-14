CREATE TABLE annual_general_meetings (
  id INTEGER NOT NULL,
  meeting_id VARCHAR(44),
  scheduled_date TIMESTAMP,
  actual_date TIMESTAMP,
  location VARCHAR(32),
  quorum_met BOOLEAN,
  total_shares_represented INTEGER,
  attendee_count INTEGER,
  board_member_id INTEGER,
  nomination_committee_id INTEGER,
  resolution_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (id),
  FOREIGN KEY (nomination_committee_id) REFERENCES nomination_committees (nomination_committee_id),
  FOREIGN KEY (resolution_id) REFERENCES resolutions (id)
);

CREATE TABLE annual_general_meetings (
  meeting_id VARCHAR(44) NOT NULL,
  meeting_date TIMESTAMP,
  location VARCHAR(32),
  total_shares_represented INTEGER,
  attendee_shareholder_count INTEGER,
  quorum_met BOOLEAN,
  minutes_published BOOLEAN,
  nomination_committee_id INTEGER,
  resolution_id VARCHAR(32),
  PRIMARY KEY (meeting_id),
  FOREIGN KEY (nomination_committee_id) REFERENCES nomination_committees (nomination_committee_id),
  FOREIGN KEY (resolution_id) REFERENCES dividend_resolutions (resolution_id)
);

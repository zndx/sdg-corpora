CREATE TABLE share_capitals (
  id INTEGER NOT NULL,
  total_value DECIMAL,
  currency_code VARCHAR(44),
  total_shares_issued INTEGER,
  voting_rights_per_share INTEGER,
  record_date DATE,
  resolution_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (resolution_id) REFERENCES dividend_resolutions (resolution_id)
);

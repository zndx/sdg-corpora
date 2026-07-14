CREATE TABLE fee_resolutions (
  id INTEGER NOT NULL,
  resolution_id VARCHAR(32),
  role_type VARCHAR(32),
  fee_amount DECIMAL,
  currency_code VARCHAR(44),
  payment_frequency VARCHAR(32),
  approved_by_meeting VARCHAR(32),
  meeting_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (meeting_id) REFERENCES annual_general_meetings (meeting_id)
);

CREATE TABLE dividend_resolutions (
  resolution_id VARCHAR(32) NOT NULL,
  amount_per_share VARCHAR(32),
  currency_code VARCHAR(44),
  payment_date DATE,
  approved_by_meeting VARCHAR(32),
  meeting_id VARCHAR(44),
  share_capital_id INTEGER,
  PRIMARY KEY (resolution_id),
  FOREIGN KEY (meeting_id) REFERENCES annual_general_meetings (meeting_id),
  FOREIGN KEY (share_capital_id) REFERENCES share_capitals (id)
);

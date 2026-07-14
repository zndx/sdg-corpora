CREATE TABLE gambling_funds (
  id INTEGER NOT NULL,
  fund_id VARCHAR(32),
  fund_amount DECIMAL,
  currency_code VARCHAR(44),
  source_activity_id VARCHAR(32),
  restriction_status VARCHAR(37),
  gambling_activity_id INTEGER,
  campaign_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (gambling_activity_id) REFERENCES gambling_activities (id),
  FOREIGN KEY (campaign_id) REFERENCES campaigns (campaign_id)
);

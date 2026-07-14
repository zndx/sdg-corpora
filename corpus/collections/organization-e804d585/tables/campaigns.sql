CREATE TABLE campaigns (
  campaign_id INTEGER NOT NULL,
  campaign_name VARCHAR(32),
  candidate_name VARCHAR(32),
  office_sought VARCHAR(32),
  ballot_question VARCHAR(32),
  status VARCHAR(32),
  gambling_fund_id INTEGER,
  regulatory_statute_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (campaign_id),
  FOREIGN KEY (gambling_fund_id) REFERENCES gambling_funds (id),
  FOREIGN KEY (regulatory_statute_id) REFERENCES regulatory_statutes (regulatory_statute_id)
);

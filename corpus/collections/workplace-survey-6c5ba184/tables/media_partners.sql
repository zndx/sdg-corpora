CREATE TABLE media_partners (
  id INTEGER NOT NULL,
  partner_id VARCHAR(32),
  partner_name VARCHAR(32),
  country VARCHAR(32),
  prestige_level VARCHAR(32),
  campaign_participation BOOLEAN,
  research_firm_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (research_firm_id) REFERENCES research_firms (research_firm_id)
);

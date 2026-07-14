CREATE TABLE regulatory_statutes (
  regulatory_statute_id INTEGER NOT NULL,
  statute_id INTEGER,
  statute_title VARCHAR(32),
  jurisdiction VARCHAR(32),
  effective_date DATE,
  restriction_type VARCHAR(50),
  gambling_activity_id INTEGER,
  campaign_id INTEGER,
  PRIMARY KEY (regulatory_statute_id),
  FOREIGN KEY (gambling_activity_id) REFERENCES gambling_activities (id),
  FOREIGN KEY (campaign_id) REFERENCES campaigns (campaign_id)
);

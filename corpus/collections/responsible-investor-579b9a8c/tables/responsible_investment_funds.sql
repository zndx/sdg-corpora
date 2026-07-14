CREATE TABLE responsible_investment_funds (
  id INTEGER NOT NULL,
  fund_id VARCHAR(32),
  fund_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  total_assets DECIMAL,
  is_empirically_analyzed BOOLEAN,
  focus_region VARCHAR(32),
  corporation_id VARCHAR(44),
  responsible_investor_id INTEGER,
  empirical_study_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (corporation_id) REFERENCES corporations (corporation_id),
  FOREIGN KEY (responsible_investor_id) REFERENCES responsible_investors (id),
  FOREIGN KEY (empirical_study_id) REFERENCES empirical_studies (id)
);

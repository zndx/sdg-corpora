CREATE TABLE empirical_studies (
  id INTEGER NOT NULL,
  study_id VARCHAR(32),
  study_title VARCHAR(32),
  region VARCHAR(32),
  data_source VARCHAR(32),
  is_theoretical_model BOOLEAN,
  has_recommendations BOOLEAN,
  responsible_investment_fund_id INTEGER,
  environmental_externality_id INTEGER,
  corporate_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (responsible_investment_fund_id) REFERENCES responsible_investment_funds (id),
  FOREIGN KEY (environmental_externality_id) REFERENCES environmental_externalities (id),
  FOREIGN KEY (corporate_policy_id) REFERENCES corporate_policies (id)
);

CREATE TABLE corporations (
  corporation_id VARCHAR(44) NOT NULL,
  name VARCHAR(32),
  industry_type VARCHAR(32),
  environmental_pollution_level DECIMAL,
  corporate_reputation_score DECIMAL,
  is_subject_of_diversification BOOLEAN,
  has_cleaning_technology BOOLEAN,
  environmental_externality_id INTEGER,
  responsible_investor_id INTEGER,
  corporate_policy_id INTEGER,
  PRIMARY KEY (corporation_id),
  FOREIGN KEY (environmental_externality_id) REFERENCES environmental_externalities (id),
  FOREIGN KEY (responsible_investor_id) REFERENCES responsible_investors (id),
  FOREIGN KEY (corporate_policy_id) REFERENCES corporate_policies (id)
);

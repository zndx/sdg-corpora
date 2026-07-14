CREATE TABLE responsible_investors (
  id INTEGER NOT NULL,
  investor_id VARCHAR(32),
  name VARCHAR(32),
  wealth DECIMAL,
  diversification_opportunities INTEGER,
  motivation_type VARCHAR(32),
  is_green_agent BOOLEAN,
  corporation_id VARCHAR(44),
  environmental_externality_id INTEGER,
  corporate_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporation_id) REFERENCES corporations (corporation_id),
  FOREIGN KEY (environmental_externality_id) REFERENCES environmental_externalities (id),
  FOREIGN KEY (corporate_policy_id) REFERENCES corporate_policies (id)
);

CREATE TABLE environmental_externalities (
  id INTEGER NOT NULL,
  externality_id VARCHAR(32),
  pollution_size DECIMAL,
  abatement_cost DECIMAL,
  impact_on_utility DECIMAL,
  is_internalized BOOLEAN,
  corporation_id VARCHAR(44),
  corporate_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporation_id) REFERENCES corporations (corporation_id),
  FOREIGN KEY (corporate_policy_id) REFERENCES corporate_policies (id)
);

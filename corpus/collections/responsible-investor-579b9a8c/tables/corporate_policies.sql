CREATE TABLE corporate_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_type VARCHAR(32),
  implementation_date TIMESTAMP,
  is_ethical BOOLEAN,
  target_pollution_reduction DECIMAL,
  corporation_id VARCHAR(44),
  environmental_externality_id INTEGER,
  responsible_investor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporation_id) REFERENCES corporations (corporation_id),
  FOREIGN KEY (environmental_externality_id) REFERENCES environmental_externalities (id),
  FOREIGN KEY (responsible_investor_id) REFERENCES responsible_investors (id)
);

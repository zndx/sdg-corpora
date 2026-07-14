CREATE TABLE institutional_investors (
  institutional_investor_id INTEGER NOT NULL,
  investor_id VARCHAR(32),
  investor_name VARCHAR(32),
  investor_type VARCHAR(32),
  total_agricultural_assets DECIMAL,
  headquarters_location VARCHAR(32),
  registration_date TIMESTAMP,
  parent_corporation_id INTEGER,
  PRIMARY KEY (institutional_investor_id),
  FOREIGN KEY (parent_corporation_id) REFERENCES parent_corporations (parent_corporation_id)
);

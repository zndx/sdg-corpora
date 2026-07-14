CREATE TABLE affiliate_councils (
  id INTEGER NOT NULL,
  council_id VARCHAR(44),
  council_name VARCHAR(32),
  network_parent VARCHAR(32),
  member_count INTEGER,
  scope_description VARCHAR(32),
  person_id INTEGER,
  non_profit_organization_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (non_profit_organization_id) REFERENCES non_profit_organizations (non_profit_organization_id)
);

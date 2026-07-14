CREATE TABLE funding_sources (
  id INTEGER NOT NULL,
  source_id VARCHAR(44),
  source_type VARCHAR(32),
  source_name VARCHAR(32),
  contribution_amount DECIMAL,
  contribution_date TIMESTAMP,
  contribution_status VARCHAR(32),
  non_profit_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (non_profit_organization_id) REFERENCES non_profit_organizations (non_profit_organization_id)
);

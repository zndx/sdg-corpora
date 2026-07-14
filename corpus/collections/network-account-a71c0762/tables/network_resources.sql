CREATE TABLE network_resources (
  network_resource_id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  resource_type VARCHAR(32),
  is_fee_based BOOLEAN,
  requires_prior_approval BOOLEAN,
  access_level VARCHAR(32),
  network_account_id INTEGER,
  acceptable_use_policy_id INTEGER,
  PRIMARY KEY (network_resource_id),
  FOREIGN KEY (network_account_id) REFERENCES network_accounts (id),
  FOREIGN KEY (acceptable_use_policy_id) REFERENCES acceptable_use_policies (id)
);

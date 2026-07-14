CREATE TABLE network_administrators (
  admin_id VARCHAR(44) NOT NULL,
  full_name VARCHAR(36),
  role_level VARCHAR(32),
  appointment_date DATE,
  is_authorized_to_revoke BOOLEAN,
  network_account_id INTEGER,
  acceptable_use_policy_id INTEGER,
  PRIMARY KEY (admin_id),
  FOREIGN KEY (network_account_id) REFERENCES network_accounts (id),
  FOREIGN KEY (acceptable_use_policy_id) REFERENCES acceptable_use_policies (id)
);

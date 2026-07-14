CREATE TABLE password_credentials (
  password_credential_id INTEGER NOT NULL,
  credential_id VARCHAR(35),
  hash_algorithm VARCHAR(32),
  strength_level INTEGER,
  is_expired BOOLEAN,
  rotation_policy_id VARCHAR(32),
  account_id VARCHAR(44),
  service_id VARCHAR(44),
  PRIMARY KEY (password_credential_id),
  FOREIGN KEY (account_id) REFERENCES user_accounts (account_id),
  FOREIGN KEY (service_id) REFERENCES network_services (service_id)
);

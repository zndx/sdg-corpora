CREATE TABLE data_processing_consents (
  id INTEGER NOT NULL,
  consent_id VARCHAR(44),
  legal_basis VARCHAR(32),
  purpose_description VARCHAR(32),
  granted_at TIMESTAMP,
  revoked_at TIMESTAMP,
  is_revoked BOOLEAN,
  user_account_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (user_account_id)
);

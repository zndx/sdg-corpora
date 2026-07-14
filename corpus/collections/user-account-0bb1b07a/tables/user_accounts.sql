CREATE TABLE user_accounts (
  user_account_id INTEGER NOT NULL,
  account_id VARCHAR(44),
  email_address VARCHAR(32),
  password_hash VARCHAR(32),
  account_status VARCHAR(32),
  created_at TIMESTAMP,
  last_login_at TIMESTAMP,
  user_session_id INTEGER,
  data_processing_consent_id INTEGER,
  PRIMARY KEY (user_account_id),
  FOREIGN KEY (user_session_id) REFERENCES user_sessions (id),
  FOREIGN KEY (data_processing_consent_id) REFERENCES data_processing_consents (id)
);

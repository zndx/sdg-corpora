CREATE TABLE web_sessions (
  session_id VARCHAR(44) NOT NULL,
  ip_address VARCHAR(32),
  browser_type VARCHAR(32),
  domain_name VARCHAR(32),
  access_timestamp TIMESTAMP,
  referring_url VARCHAR(68),
  session_duration_seconds INTEGER,
  is_secure BOOLEAN,
  user_account_id INTEGER,
  cookie_record_id INTEGER,
  PRIMARY KEY (session_id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (id),
  FOREIGN KEY (cookie_record_id) REFERENCES cookie_records (id)
);

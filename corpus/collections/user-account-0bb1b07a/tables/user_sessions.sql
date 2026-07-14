CREATE TABLE user_sessions (
  id INTEGER NOT NULL,
  session_id VARCHAR(44),
  ip_address VARCHAR(32),
  user_agent VARCHAR(32),
  operating_system VARCHAR(32),
  device_name VARCHAR(32),
  country_code VARCHAR(44),
  session_start TIMESTAMP,
  session_end TIMESTAMP,
  user_account_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (user_account_id)
);

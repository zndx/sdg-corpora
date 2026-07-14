CREATE TABLE cookie_records (
  id INTEGER NOT NULL,
  cookie_id INTEGER,
  cookie_name VARCHAR(32),
  content_hash VARCHAR(32),
  expiration_date DATE,
  is_essential BOOLEAN,
  session_id VARCHAR(44),
  user_account_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (session_id) REFERENCES web_sessions (session_id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (id)
);

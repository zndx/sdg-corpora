CREATE TABLE cookie_identifiers (
  id INTEGER NOT NULL,
  cookie_id INTEGER,
  cookie_name VARCHAR(32),
  purpose VARCHAR(32),
  expiry_date DATE,
  is_third_party BOOLEAN,
  user_session_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (user_session_id) REFERENCES user_sessions (id)
);

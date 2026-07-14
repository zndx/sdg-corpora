CREATE TABLE data_subjects (
  id INTEGER NOT NULL,
  subject_identifier VARCHAR(32),
  given_name VARCHAR(32),
  family_name VARCHAR(32),
  email_address VARCHAR(32),
  ip_address VARCHAR(32),
  cookie_id INTEGER,
  PRIMARY KEY (id)
);

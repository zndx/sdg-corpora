CREATE TABLE principal_investigators (
  id INTEGER NOT NULL,
  investigator_id VARCHAR(32),
  full_name VARCHAR(36),
  title VARCHAR(32),
  affiliation VARCHAR(32),
  contact_email VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);

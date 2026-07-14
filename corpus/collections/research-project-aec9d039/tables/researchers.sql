CREATE TABLE researchers (
  researcher_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  institution VARCHAR(32),
  department VARCHAR(32),
  role VARCHAR(32),
  institution_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (researcher_id),
  FOREIGN KEY (institution_id) REFERENCES institutions (institution_id)
);

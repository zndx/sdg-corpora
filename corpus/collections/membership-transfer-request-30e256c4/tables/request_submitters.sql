CREATE TABLE request_submitters (
  id INTEGER NOT NULL,
  submitter_name VARCHAR(32),
  submitter_email VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);

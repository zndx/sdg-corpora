CREATE TABLE choreographers (
  id INTEGER NOT NULL,
  choreographer_name VARCHAR(32),
  nationality VARCHAR(32),
  creation_date DATE,
  dedication_target VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE computational_examples (
  id INTEGER NOT NULL,
  example_id INTEGER,
  title VARCHAR(32),
  file_format VARCHAR(32),
  file_size_bytes INTEGER,
  creation_date DATE,
  author VARCHAR(32),
  license VARCHAR(32),
  digital_repository_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (digital_repository_id) REFERENCES digital_repositories (id)
);

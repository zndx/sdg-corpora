CREATE TABLE data_repositories (
  repository_id INTEGER NOT NULL,
  repository_name VARCHAR(32),
  location VARCHAR(32),
  capacity_t_b DECIMAL,
  last_updated TIMESTAMP,
  access_protocol VARCHAR(32),
  PRIMARY KEY (repository_id)
);

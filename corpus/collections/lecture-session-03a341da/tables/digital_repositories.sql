CREATE TABLE digital_repositories (
  id INTEGER NOT NULL,
  repository_id INTEGER,
  name VARCHAR(32),
  storage_path VARCHAR(32),
  total_capacity_g_b DECIMAL,
  last_backup TIMESTAMP,
  access_level VARCHAR(32),
  PRIMARY KEY (id)
);

CREATE TABLE network_accounts (
  id INTEGER NOT NULL,
  account_identifier VARCHAR(32),
  username VARCHAR(32),
  password_hash VARCHAR(32),
  status VARCHAR(32),
  creation_date TIMESTAMP,
  last_login_timestamp TIMESTAMP,
  account_type VARCHAR(32),
  student_id INTEGER,
  network_administrator_admin_id VARCHAR(44),
  network_resource_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (network_administrator_admin_id) REFERENCES network_administrators (admin_id),
  FOREIGN KEY (network_resource_id) REFERENCES network_resources (network_resource_id)
);

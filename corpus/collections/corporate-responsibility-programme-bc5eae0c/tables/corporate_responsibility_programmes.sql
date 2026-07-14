CREATE TABLE corporate_responsibility_programmes (
  id INTEGER NOT NULL,
  programme_identifier VARCHAR(32),
  programme_name VARCHAR(32),
  start_date TIMESTAMP,
  status VARCHAR(32),
  scope VARCHAR(32),
  executive_role_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_role_id) REFERENCES executive_roles (executive_role_id)
);

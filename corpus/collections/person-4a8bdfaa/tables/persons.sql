CREATE TABLE persons (
  id INTEGER NOT NULL,
  person_id VARCHAR(32),
  full_name VARCHAR(36),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  role_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);

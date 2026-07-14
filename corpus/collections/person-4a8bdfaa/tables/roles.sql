CREATE TABLE roles (
  id INTEGER NOT NULL,
  role_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);

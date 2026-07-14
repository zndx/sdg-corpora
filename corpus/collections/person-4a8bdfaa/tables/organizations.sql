CREATE TABLE organizations (
  organization_id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  founding_date DATE,
  status VARCHAR(32),
  person_id INTEGER,
  role_id INTEGER,
  PRIMARY KEY (organization_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

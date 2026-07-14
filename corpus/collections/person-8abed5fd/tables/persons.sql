CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email_address VARCHAR(32),
  phone VARCHAR(32),
  years_of_experience INTEGER,
  professional_role_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (professional_role_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);

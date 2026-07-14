CREATE TABLE professional_roles (
  professional_role_id INTEGER NOT NULL,
  role_title VARCHAR(32),
  department VARCHAR(32),
  start_date DATE,
  responsibilities VARCHAR(32),
  reporting_to VARCHAR(32),
  person_id INTEGER,
  organization_id INTEGER,
  strategic_initiative_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (professional_role_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (strategic_initiative_id) REFERENCES strategic_initiatives (id)
);

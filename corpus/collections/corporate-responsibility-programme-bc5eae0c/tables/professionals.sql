CREATE TABLE professionals (
  id INTEGER NOT NULL,
  professional_id INTEGER,
  full_name VARCHAR(36),
  birth_date DATE,
  current_employer VARCHAR(38),
  primary_expertise VARCHAR(32),
  executive_role_id INTEGER,
  educational_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_role_id) REFERENCES executive_roles (executive_role_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (id)
);

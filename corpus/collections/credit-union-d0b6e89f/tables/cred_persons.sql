CREATE TABLE cred_persons (
  id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  date_of_birth DATE,
  residence_city VARCHAR(32),
  residence_state VARCHAR(32),
  marital_status VARCHAR(32),
  number_of_dependents INTEGER,
  executive_role_id INTEGER,
  educational_institution_id INTEGER,
  award_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_role_id) REFERENCES cred_executive_roles (executive_role_id),
  FOREIGN KEY (educational_institution_id) REFERENCES cred_educational_institutions (educational_institution_id),
  FOREIGN KEY (award_id) REFERENCES cred_awards (id)
);

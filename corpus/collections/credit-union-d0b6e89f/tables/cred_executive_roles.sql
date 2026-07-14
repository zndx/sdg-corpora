CREATE TABLE cred_executive_roles (
  executive_role_id INTEGER NOT NULL,
  role_title VARCHAR(32),
  appointment_date DATE,
  termination_date DATE,
  reporting_to VARCHAR(32),
  compensation_band VARCHAR(32),
  is_current BOOLEAN,
  person_id INTEGER,
  credit_union_id INTEGER,
  previously_held_executive_role_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (executive_role_id),
  FOREIGN KEY (person_id) REFERENCES cred_persons (id),
  FOREIGN KEY (credit_union_id) REFERENCES cred_credit_unions (id),
  FOREIGN KEY (previously_held_executive_role_id) REFERENCES cred_executive_roles (executive_role_id)
);

CREATE TABLE roles_procedures (
  role_code VARCHAR(32) NOT NULL,
  safeguarding_procedure_id INTEGER NOT NULL,
  PRIMARY KEY (role_code, safeguarding_procedure_id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code),
  FOREIGN KEY (safeguarding_procedure_id) REFERENCES safeguarding_procedures (safeguarding_procedure_id)
);

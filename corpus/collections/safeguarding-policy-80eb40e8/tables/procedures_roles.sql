CREATE TABLE procedures_roles (
  safeguarding_procedure_id INTEGER NOT NULL,
  role_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (safeguarding_procedure_id, role_code),
  FOREIGN KEY (safeguarding_procedure_id) REFERENCES safeguarding_procedures (safeguarding_procedure_id),
  FOREIGN KEY (role_code) REFERENCES staff_roles (role_code)
);

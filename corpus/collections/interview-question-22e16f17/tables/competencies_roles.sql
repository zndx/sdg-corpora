CREATE TABLE competencies_roles (
  competency_id INTEGER NOT NULL,
  role_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (competency_id, role_code),
  FOREIGN KEY (competency_id) REFERENCES competencies (competency_id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code)
);

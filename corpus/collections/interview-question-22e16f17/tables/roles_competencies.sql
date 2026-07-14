CREATE TABLE roles_competencies (
  role_code VARCHAR(32) NOT NULL,
  competency_id INTEGER NOT NULL,
  PRIMARY KEY (role_code, competency_id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code),
  FOREIGN KEY (competency_id) REFERENCES competencies (competency_id)
);

CREATE TABLE roles_competencies (
  professional_role_id INTEGER NOT NULL,
  competency_id INTEGER NOT NULL,
  PRIMARY KEY (professional_role_id, competency_id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (id),
  FOREIGN KEY (competency_id) REFERENCES competencies (id)
);

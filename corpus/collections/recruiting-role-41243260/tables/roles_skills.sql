CREATE TABLE roles_skills (
  recruiting_role_job_posting_id INTEGER NOT NULL,
  professional_skill_id INTEGER NOT NULL,
  PRIMARY KEY (recruiting_role_job_posting_id, professional_skill_id),
  FOREIGN KEY (recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id),
  FOREIGN KEY (professional_skill_id) REFERENCES professional_skills (id)
);

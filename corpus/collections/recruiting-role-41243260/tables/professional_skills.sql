CREATE TABLE professional_skills (
  id INTEGER NOT NULL,
  skill_id VARCHAR(37),
  skill_name VARCHAR(32),
  proficiency_level VARCHAR(32),
  category VARCHAR(32),
  certification_required BOOLEAN,
  recruiting_role_job_posting_id INTEGER,
  candidate_profile_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (recruiting_role_job_posting_id) REFERENCES recruiting_roles (job_posting_id),
  FOREIGN KEY (candidate_profile_id) REFERENCES candidate_profiles (candidate_profile_id)
);

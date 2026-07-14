CREATE TABLE professional_roles (
  id INTEGER NOT NULL,
  role_name VARCHAR(32),
  role_category VARCHAR(32),
  primary_responsibility VARCHAR(32),
  academic_program_id INTEGER,
  research_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (research_activity_id) REFERENCES research_activities (id)
);

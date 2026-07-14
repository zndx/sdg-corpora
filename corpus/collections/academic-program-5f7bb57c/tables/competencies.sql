CREATE TABLE competencies (
  id INTEGER NOT NULL,
  competency_i_d VARCHAR(32),
  competency_title VARCHAR(32),
  competency_description VARCHAR(32),
  proficiency_level VARCHAR(32),
  assessment_type VARCHAR(32),
  academic_program_id INTEGER,
  professional_role_id INTEGER,
  research_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_program_id) REFERENCES academic_programs (academic_program_id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (id),
  FOREIGN KEY (research_activity_id) REFERENCES research_activities (id)
);

CREATE TABLE staff_members (
  staff_member_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  employer VARCHAR(32),
  training_completion_date DATE,
  performance_rating VARCHAR(32),
  motivation_level VARCHAR(32),
  years_of_experience INTEGER,
  training_program_id INTEGER,
  beneficiary_group_id INTEGER,
  research_study_id INTEGER,
  PRIMARY KEY (staff_member_id),
  FOREIGN KEY (training_program_id) REFERENCES training_programs (id),
  FOREIGN KEY (beneficiary_group_id) REFERENCES beneficiary_groups (beneficiary_group_id),
  FOREIGN KEY (research_study_id) REFERENCES research_studies (research_study_id)
);

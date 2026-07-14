CREATE TABLE assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_name VARCHAR(32),
  assessment_type VARCHAR(32),
  target_skill VARCHAR(32),
  is_digital BOOLEAN,
  last_administered DATE,
  library_program_id INTEGER,
  future_ready_goal_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (library_program_id) REFERENCES library_programs (library_program_id),
  FOREIGN KEY (future_ready_goal_id) REFERENCES future_ready_goals (future_ready_goal_id)
);

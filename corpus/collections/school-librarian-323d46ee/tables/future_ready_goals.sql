CREATE TABLE future_ready_goals (
  future_ready_goal_id INTEGER NOT NULL,
  goal_id VARCHAR(44),
  goal_name VARCHAR(32),
  goal_category VARCHAR(32),
  priority_level INTEGER,
  is_met BOOLEAN,
  last_assessed DATE,
  library_program_id INTEGER,
  assessment_id INTEGER,
  PRIMARY KEY (future_ready_goal_id),
  FOREIGN KEY (library_program_id) REFERENCES library_programs (library_program_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (id)
);

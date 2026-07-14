CREATE TABLE library_programs (
  library_program_id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  program_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  is_active BOOLEAN,
  target_audience VARCHAR(32),
  librarian_id VARCHAR(32),
  space_id VARCHAR(32),
  digital_resource_id INTEGER,
  future_ready_goal_id INTEGER,
  PRIMARY KEY (library_program_id),
  FOREIGN KEY (librarian_id) REFERENCES school_librarians (librarian_id),
  FOREIGN KEY (space_id) REFERENCES flexible_spaces (space_id),
  FOREIGN KEY (digital_resource_id) REFERENCES digital_resources (digital_resource_id),
  FOREIGN KEY (future_ready_goal_id) REFERENCES future_ready_goals (future_ready_goal_id)
);

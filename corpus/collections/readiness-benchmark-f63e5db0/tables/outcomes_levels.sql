CREATE TABLE outcomes_levels (
  outcome_id VARCHAR(32) NOT NULL,
  course_level_id INTEGER NOT NULL,
  PRIMARY KEY (outcome_id, course_level_id),
  FOREIGN KEY (outcome_id) REFERENCES learning_outcomes (outcome_id),
  FOREIGN KEY (course_level_id) REFERENCES course_levels (course_level_id)
);

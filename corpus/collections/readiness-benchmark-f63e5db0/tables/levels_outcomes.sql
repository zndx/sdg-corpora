CREATE TABLE levels_outcomes (
  course_level_id INTEGER NOT NULL,
  outcome_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (course_level_id, outcome_id),
  FOREIGN KEY (course_level_id) REFERENCES course_levels (course_level_id),
  FOREIGN KEY (outcome_id) REFERENCES learning_outcomes (outcome_id)
);

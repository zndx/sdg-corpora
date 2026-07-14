CREATE TABLE platforms_exercises (
  digital_platform_id INTEGER NOT NULL,
  statistical_exercise_id INTEGER NOT NULL,
  PRIMARY KEY (digital_platform_id, statistical_exercise_id),
  FOREIGN KEY (digital_platform_id) REFERENCES digital_platforms (id),
  FOREIGN KEY (statistical_exercise_id) REFERENCES statistical_exercises (id)
);

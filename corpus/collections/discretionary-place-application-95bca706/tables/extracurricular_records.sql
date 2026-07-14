CREATE TABLE extracurricular_records (
  extracurricular_record_id INTEGER NOT NULL,
  activity_name VARCHAR(32),
  activity_type VARCHAR(32),
  achievement_level VARCHAR(32),
  score_points INTEGER,
  student_id INTEGER,
  discretionary_place_application_id INTEGER,
  PRIMARY KEY (extracurricular_record_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (discretionary_place_application_id) REFERENCES discretionary_place_applications (discretionary_place_application_id)
);

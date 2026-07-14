CREATE TABLE interview_scores (
  interview_score_id INTEGER NOT NULL,
  appearance_score INTEGER,
  politeness_score INTEGER,
  manner_score INTEGER,
  total_interview_score DECIMAL,
  interview_date TIMESTAMP,
  student_id INTEGER,
  discretionary_place_application_id INTEGER,
  PRIMARY KEY (interview_score_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (discretionary_place_application_id) REFERENCES discretionary_place_applications (discretionary_place_application_id)
);

CREATE TABLE examination_papers (
  id INTEGER NOT NULL,
  paper_id INTEGER,
  subject_code VARCHAR(40),
  class_level VARCHAR(32),
  academic_session VARCHAR(32),
  max_time_minutes INTEGER,
  total_marks INTEGER,
  total_questions INTEGER,
  required_answers INTEGER,
  publication_date TIMESTAMP,
  subject_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);

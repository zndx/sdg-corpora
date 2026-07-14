CREATE TABLE subjects (
  subject_id INTEGER NOT NULL,
  subject_code VARCHAR(40),
  name VARCHAR(32),
  class_level VARCHAR(32),
  department VARCHAR(32),
  credits INTEGER,
  examination_paper_id INTEGER,
  PRIMARY KEY (subject_id),
  FOREIGN KEY (examination_paper_id) REFERENCES examination_papers (id)
);

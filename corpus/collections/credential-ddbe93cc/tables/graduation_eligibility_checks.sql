CREATE TABLE graduation_eligibility_checks (
  id INTEGER NOT NULL,
  check_id VARCHAR(44),
  check_date TIMESTAMP,
  eligibility_status VARCHAR(32),
  ggpa_met BOOLEAN,
  residency_met BOOLEAN,
  financial_obligations_met BOOLEAN,
  completion_deadline_met BOOLEAN,
  student_id INTEGER,
  program_of_study_id INTEGER,
  parchment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (program_of_study_id) REFERENCES program_of_studies (id),
  FOREIGN KEY (parchment_id) REFERENCES parchments (parchment_id)
);

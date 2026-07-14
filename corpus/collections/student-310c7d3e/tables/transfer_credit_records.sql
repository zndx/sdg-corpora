CREATE TABLE transfer_credit_records (
  id INTEGER NOT NULL,
  source_institution VARCHAR(32),
  credits_applied INTEGER,
  evaluation_status VARCHAR(32),
  student_id INTEGER,
  curriculum_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (curriculum_requirement_id) REFERENCES curriculum_requirements (id)
);

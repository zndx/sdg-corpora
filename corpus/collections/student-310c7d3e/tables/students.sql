CREATE TABLE students (
  id INTEGER NOT NULL,
  id_number VARCHAR(44),
  name VARCHAR(32),
  signature_date TIMESTAMP,
  academic_advisor_id INTEGER,
  degree_program_id INTEGER,
  transfer_credit_record_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_advisor_id) REFERENCES academic_advisors (id),
  FOREIGN KEY (degree_program_id) REFERENCES degree_programs (id),
  FOREIGN KEY (transfer_credit_record_id) REFERENCES transfer_credit_records (id)
);

CREATE TABLE enrollments (
  id INTEGER NOT NULL,
  registration_fee DECIMAL,
  monthly_tuition DECIMAL,
  late_fee_amount DECIMAL,
  payment_due_day INTEGER,
  late_fee_deadline_day INTEGER,
  program_months VARCHAR(32),
  consent_given BOOLEAN,
  waiver_signed BOOLEAN,
  enrollment_date DATE,
  student_id INTEGER,
  acquisition_source_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (acquisition_source_id) REFERENCES acquisition_sources (acquisition_source_id)
);

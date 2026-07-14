CREATE TABLE enrollments (
  id INTEGER NOT NULL,
  enrollment_id VARCHAR(32),
  registration_fee DECIMAL,
  monthly_tuition DECIMAL,
  late_fee DECIMAL,
  enrollment_date TIMESTAMP,
  program_period_start DATE,
  program_period_end DATE,
  is_refundable BOOLEAN,
  student_id INTEGER,
  media_release_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (media_release_id) REFERENCES media_releases (id)
);

CREATE TABLE students (
  id INTEGER NOT NULL,
  student_id VARCHAR(32),
  full_name VARCHAR(36),
  enrollment_status VARCHAR(32),
  study_level VARCHAR(32),
  residence_status BOOLEAN,
  admission_notification_date DATE,
  conduct_violation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (conduct_violation_id) REFERENCES conduct_violations (id)
);

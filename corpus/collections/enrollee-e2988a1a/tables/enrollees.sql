CREATE TABLE enrollees (
  id INTEGER NOT NULL,
  enrollee_id VARCHAR(44),
  enrollment_date DATE,
  plan_name VARCHAR(32),
  status VARCHAR(32),
  reminder_letter_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (reminder_letter_id) REFERENCES reminder_letters (reminder_letter_id)
);

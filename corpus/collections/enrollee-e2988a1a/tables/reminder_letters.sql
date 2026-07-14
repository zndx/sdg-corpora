CREATE TABLE reminder_letters (
  reminder_letter_id INTEGER NOT NULL,
  letter_id VARCHAR(32),
  sent_date TIMESTAMP,
  reminder_type VARCHAR(32),
  enrollee_id INTEGER,
  prescription_id INTEGER,
  PRIMARY KEY (reminder_letter_id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (id)
);

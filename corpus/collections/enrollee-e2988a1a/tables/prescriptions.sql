CREATE TABLE prescriptions (
  id INTEGER NOT NULL,
  prescription_id VARCHAR(35),
  fill_date TIMESTAMP,
  quantity INTEGER,
  dosage VARCHAR(32),
  requires_prior_authorization BOOLEAN,
  is_non_formulary BOOLEAN,
  schedule VARCHAR(32),
  provider_id INTEGER,
  medication_id INTEGER,
  enrollee_id INTEGER,
  reminder_letter_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (medication_id) REFERENCES medications (medication_id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (id),
  FOREIGN KEY (reminder_letter_id) REFERENCES reminder_letters (reminder_letter_id)
);

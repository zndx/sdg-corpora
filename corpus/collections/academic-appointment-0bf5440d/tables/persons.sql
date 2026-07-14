CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  birth_date DATE,
  nationality VARCHAR(32),
  academic_appointment_id INTEGER,
  law_enforcement_appointment_id INTEGER,
  academic_award_id INTEGER,
  academic_institution_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (person_id),
  FOREIGN KEY (academic_appointment_id) REFERENCES academic_appointments (id),
  FOREIGN KEY (law_enforcement_appointment_id) REFERENCES law_enforcement_appointments (id),
  FOREIGN KEY (academic_award_id) REFERENCES academic_awards (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id)
);

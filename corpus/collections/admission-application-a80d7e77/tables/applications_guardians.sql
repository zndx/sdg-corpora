CREATE TABLE applications_guardians (
  admission_application_id INTEGER NOT NULL,
  guardian_id INTEGER NOT NULL,
  PRIMARY KEY (admission_application_id, guardian_id),
  FOREIGN KEY (admission_application_id) REFERENCES admission_applications (id),
  FOREIGN KEY (guardian_id) REFERENCES guardians (guardian_id)
);

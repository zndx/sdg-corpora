CREATE TABLE enrollees_prescriptions (
  enrollee_id INTEGER NOT NULL,
  prescription_id INTEGER NOT NULL,
  PRIMARY KEY (enrollee_id, prescription_id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (id),
  FOREIGN KEY (prescription_id) REFERENCES prescriptions (id)
);

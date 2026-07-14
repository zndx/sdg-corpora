CREATE TABLE clinicians_medicines (
  clinician_id INTEGER NOT NULL,
  medicine_id INTEGER NOT NULL,
  PRIMARY KEY (clinician_id, medicine_id),
  FOREIGN KEY (clinician_id) REFERENCES clinicians (id),
  FOREIGN KEY (medicine_id) REFERENCES medicines (id)
);

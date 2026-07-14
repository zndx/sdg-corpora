CREATE TABLE medicines (
  id INTEGER NOT NULL,
  medicine_id VARCHAR(32),
  medicine_name VARCHAR(32),
  medicine_type VARCHAR(32),
  prescription_status VARCHAR(32),
  storage_condition VARCHAR(32),
  clinical_need_justification VARCHAR(32),
  clinician_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinician_id) REFERENCES clinicians (id)
);

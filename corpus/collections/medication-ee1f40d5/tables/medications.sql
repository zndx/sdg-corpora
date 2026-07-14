CREATE TABLE medications (
  id INTEGER NOT NULL,
  medication_id VARCHAR(44),
  brand_name VARCHAR(33),
  generic_name VARCHAR(32),
  dosage_form VARCHAR(32),
  strength VARCHAR(32),
  administration_route VARCHAR(32),
  medication_fact_sheet_id INTEGER,
  patient_id VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (medication_fact_sheet_id) REFERENCES medication_fact_sheets (id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
);

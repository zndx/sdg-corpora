CREATE TABLE patients (
  patient_id VARCHAR(32) NOT NULL,
  admission_date DATE,
  discharge_date DATE,
  room_number VARCHAR(32),
  bed_number VARCHAR(32),
  hcahps_score DECIMAL,
  medication_id INTEGER,
  medication_fact_sheet_id INTEGER,
  display_endpoint_id INTEGER,
  PRIMARY KEY (patient_id),
  FOREIGN KEY (medication_id) REFERENCES medications (id),
  FOREIGN KEY (medication_fact_sheet_id) REFERENCES medication_fact_sheets (id),
  FOREIGN KEY (display_endpoint_id) REFERENCES display_endpoints (id)
);

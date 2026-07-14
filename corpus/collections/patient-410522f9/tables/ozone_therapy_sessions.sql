CREATE TABLE ozone_therapy_sessions (
  id INTEGER NOT NULL,
  session_number INTEGER,
  ozone_concentration DECIMAL,
  ozone_dose DECIMAL,
  treatment_date TIMESTAMP,
  administered_by VARCHAR(32),
  session_status VARCHAR(32),
  patient_id INTEGER,
  ozone_therapy_protocol_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (ozone_therapy_protocol_id) REFERENCES ozone_therapy_protocols (ozone_therapy_protocol_id)
);

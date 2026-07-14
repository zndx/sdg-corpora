CREATE TABLE protocols_patients (
  ozone_therapy_protocol_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  PRIMARY KEY (ozone_therapy_protocol_id, patient_id),
  FOREIGN KEY (ozone_therapy_protocol_id) REFERENCES ozone_therapy_protocols (ozone_therapy_protocol_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id)
);

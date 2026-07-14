CREATE TABLE patients_sessions (
  patient_id INTEGER NOT NULL,
  ozone_therapy_session_id INTEGER NOT NULL,
  PRIMARY KEY (patient_id, ozone_therapy_session_id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (ozone_therapy_session_id) REFERENCES ozone_therapy_sessions (id)
);

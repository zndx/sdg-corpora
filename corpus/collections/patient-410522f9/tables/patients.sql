CREATE TABLE patients (
  id INTEGER NOT NULL,
  patient_id VARCHAR(32),
  age INTEGER,
  sex VARCHAR(32),
  diagnosis VARCHAR(37),
  disease_duration DECIMAL,
  baseline_visual_acuity DECIMAL,
  baseline_visual_field DECIMAL,
  baseline_v_e_p DECIMAL,
  baseline_p_r_c_s_t DECIMAL,
  treatment_group VARCHAR(32),
  ozone_therapy_protocol_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ozone_therapy_protocol_id) REFERENCES ozone_therapy_protocols (ozone_therapy_protocol_id)
);

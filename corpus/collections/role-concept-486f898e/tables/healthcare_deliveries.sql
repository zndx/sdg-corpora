CREATE TABLE healthcare_deliveries (
  healthcare_delivery_id INTEGER NOT NULL,
  delivery_id VARCHAR(44),
  service_type VARCHAR(32),
  complexity_level VARCHAR(32),
  patient_needs VARCHAR(32),
  effectiveness VARCHAR(32),
  c_l_d_n_id INTEGER,
  enactment_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (healthcare_delivery_id),
  FOREIGN KEY (c_l_d_n_id) REFERENCES c_l_d_ns (id),
  FOREIGN KEY (enactment_id) REFERENCES role_enactments (enactment_id)
);

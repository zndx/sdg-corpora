CREATE TABLE vehicle_identification_records (
  vehicle_identification_record_id INTEGER NOT NULL,
  record_id INTEGER,
  license_plate_number VARCHAR(32),
  state_issued VARCHAR(32),
  vehicle_make VARCHAR(32),
  vehicle_model VARCHAR(32),
  capture_timestamp TIMESTAMP,
  ocr_confidence_score DECIMAL,
  customer_profile_id INTEGER,
  personal_data_record_id INTEGER,
  PRIMARY KEY (vehicle_identification_record_id),
  FOREIGN KEY (customer_profile_id) REFERENCES customer_profiles (id),
  FOREIGN KEY (personal_data_record_id) REFERENCES personal_data_records (id)
);

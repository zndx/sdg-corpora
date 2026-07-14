CREATE TABLE energy_outputs (
  id INTEGER NOT NULL,
  output_id VARCHAR(44),
  energy_type VARCHAR(32),
  capacity_megawatts DECIMAL,
  daily_generation_m_wh DECIMAL,
  grid_connection_status VARCHAR(32),
  measurement_date TIMESTAMP,
  waste_processing_facility_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (waste_processing_facility_id) REFERENCES waste_processing_facilities (waste_processing_facility_id)
);

CREATE TABLE waste_processing_facilities (
  waste_processing_facility_id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  facility_name VARCHAR(32),
  location VARCHAR(32),
  capacity_tons_per_day DECIMAL,
  operational_status VARCHAR(32),
  commissioning_date DATE,
  waste_stream_id INTEGER,
  energy_output_id INTEGER,
  PRIMARY KEY (waste_processing_facility_id),
  FOREIGN KEY (waste_stream_id) REFERENCES waste_streams (id),
  FOREIGN KEY (energy_output_id) REFERENCES energy_outputs (id)
);

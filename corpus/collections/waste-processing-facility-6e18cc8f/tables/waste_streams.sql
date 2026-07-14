CREATE TABLE waste_streams (
  id INTEGER NOT NULL,
  stream_id VARCHAR(44),
  waste_type VARCHAR(32),
  origin_jurisdiction VARCHAR(32),
  daily_volume_tons DECIMAL,
  collection_frequency VARCHAR(32),
  hauler_contract_id INTEGER,
  waste_processing_facility_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (waste_processing_facility_id) REFERENCES waste_processing_facilities (waste_processing_facility_id)
);

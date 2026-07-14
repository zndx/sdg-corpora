CREATE TABLE appeal_waivers (
  appeal_waiver_id INTEGER NOT NULL,
  waiver_id VARCHAR(44),
  waiver_date DATE,
  property_identifier VARCHAR(32),
  status VARCHAR(32),
  certified_by VARCHAR(32),
  property_parcel_id INTEGER,
  board_of_equalization_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (appeal_waiver_id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (board_of_equalization_id) REFERENCES board_of_equalizations (board_of_equalization_id)
);

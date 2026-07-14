CREATE TABLE resource_extraction_events (
  id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  measurement_date_time TIMESTAMP,
  volume_barrels DECIMAL,
  volume_thousand_cubic_feet DECIMAL,
  pressure_p_s_i DECIMAL,
  fluid_type VARCHAR(32),
  extraction_well_id INTEGER,
  land_parcel_id INTEGER,
  jurisdictional_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (extraction_well_id) REFERENCES extraction_wells (id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (land_parcel_id),
  FOREIGN KEY (jurisdictional_statute_id) REFERENCES jurisdictional_statutes (id)
);

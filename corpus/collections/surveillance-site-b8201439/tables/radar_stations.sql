CREATE TABLE radar_stations (
  radar_station_id INTEGER NOT NULL,
  radar_identifier VARCHAR(32),
  radar_model VARCHAR(32),
  frequency_band VARCHAR(32),
  max_range DECIMAL,
  installation_date DATE,
  last_maintenance_date DATE,
  is_upgraded BOOLEAN,
  surveillance_site_id INTEGER,
  data_acquisition_unit_id INTEGER,
  PRIMARY KEY (radar_station_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id)
);

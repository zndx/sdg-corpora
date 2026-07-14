CREATE TABLE emissions_test_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  test_type VARCHAR(32),
  status VARCHAR(32),
  emission_source_id INTEGER,
  emissions_monitoring_station_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (emission_source_id) REFERENCES emission_sources (emission_source_id),
  FOREIGN KEY (emissions_monitoring_station_id) REFERENCES emissions_monitoring_stations (id)
);

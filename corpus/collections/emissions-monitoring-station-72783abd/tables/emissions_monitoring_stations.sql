CREATE TABLE emissions_monitoring_stations (
  id INTEGER NOT NULL,
  station_id VARCHAR(44),
  installation_date DATE,
  last_calibration_date DATE,
  operational_status VARCHAR(32),
  manufacturer VARCHAR(46),
  model_number VARCHAR(32),
  emission_source_id INTEGER,
  test_crew_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (emission_source_id) REFERENCES emission_sources (emission_source_id),
  FOREIGN KEY (test_crew_id) REFERENCES test_crews (test_crew_id)
);

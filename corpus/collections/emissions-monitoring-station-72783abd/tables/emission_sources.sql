CREATE TABLE emission_sources (
  emission_source_id INTEGER NOT NULL,
  source_id VARCHAR(44),
  source_type VARCHAR(32),
  commissioning_date DATE,
  operational_status VARCHAR(32),
  fuel_type VARCHAR(32),
  capacity_mw DECIMAL,
  emissions_monitoring_station_id INTEGER,
  test_crew_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (emission_source_id),
  FOREIGN KEY (emissions_monitoring_station_id) REFERENCES emissions_monitoring_stations (id),
  FOREIGN KEY (test_crew_id) REFERENCES test_crews (test_crew_id)
);

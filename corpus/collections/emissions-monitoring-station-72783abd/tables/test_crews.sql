CREATE TABLE test_crews (
  test_crew_id INTEGER NOT NULL,
  crew_id VARCHAR(35),
  crew_name VARCHAR(32),
  supervisor_id VARCHAR(35),
  certification_level VARCHAR(32),
  active_since DATE,
  manager_id VARCHAR(44),
  emission_source_id INTEGER,
  emissions_monitoring_station_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (test_crew_id),
  FOREIGN KEY (manager_id) REFERENCES project_managers (manager_id),
  FOREIGN KEY (emission_source_id) REFERENCES emission_sources (emission_source_id),
  FOREIGN KEY (emissions_monitoring_station_id) REFERENCES emissions_monitoring_stations (id)
);

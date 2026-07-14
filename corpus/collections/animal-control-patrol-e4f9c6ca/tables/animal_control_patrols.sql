CREATE TABLE animal_control_patrols (
  animal_control_patrol_id INTEGER NOT NULL,
  patrol_id INTEGER,
  assigned_area VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  patrol_type VARCHAR(32),
  weather_conditions VARCHAR(32),
  officer_badge_number VARCHAR(32),
  officer_id INTEGER,
  incident_report_id INTEGER,
  PRIMARY KEY (animal_control_patrol_id),
  FOREIGN KEY (officer_id) REFERENCES animal_services_officers (officer_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);

CREATE TABLE vector_control_activities (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  spray_date TIMESTAMP,
  treated_area VARCHAR(32),
  chemical_agent VARCHAR(32),
  calibration_status VARCHAR(32),
  report_status VARCHAR(32),
  animal_control_officer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id)
);

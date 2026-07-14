CREATE TABLE measurement_activities (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  protocol_version VARCHAR(32),
  instrument_used VARCHAR(32),
  status VARCHAR(32),
  healthcare_professional_id INTEGER,
  quality_improvement_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (healthcare_professional_id) REFERENCES healthcare_professionals (healthcare_professional_id),
  FOREIGN KEY (quality_improvement_program_id) REFERENCES quality_improvement_programs (id)
);

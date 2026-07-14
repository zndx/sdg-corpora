CREATE TABLE capacity_building_trainings (
  capacity_building_training_id INTEGER NOT NULL,
  training_id VARCHAR(44),
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  target_audience VARCHAR(32),
  status VARCHAR(32),
  participants_count INTEGER,
  quality_assurance_office_id INTEGER,
  quality_assurance_system_id INTEGER,
  PRIMARY KEY (capacity_building_training_id),
  FOREIGN KEY (quality_assurance_office_id) REFERENCES quality_assurance_offices (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id)
);

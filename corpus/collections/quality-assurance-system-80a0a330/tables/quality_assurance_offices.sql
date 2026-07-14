CREATE TABLE quality_assurance_offices (
  id INTEGER NOT NULL,
  office_id INTEGER,
  office_name VARCHAR(32),
  establishment_date DATE,
  location VARCHAR(32),
  status VARCHAR(32),
  staff_count INTEGER,
  quality_assurance_system_id INTEGER,
  capacity_building_training_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id),
  FOREIGN KEY (capacity_building_training_id) REFERENCES capacity_building_trainings (capacity_building_training_id)
);

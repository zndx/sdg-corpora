CREATE TABLE national_commissions (
  id INTEGER NOT NULL,
  commission_id VARCHAR(44),
  name VARCHAR(32),
  country VARCHAR(32),
  establishment_date DATE,
  status VARCHAR(32),
  jurisdiction_level VARCHAR(32),
  quality_assurance_system_id INTEGER,
  capacity_building_training_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id),
  FOREIGN KEY (capacity_building_training_id) REFERENCES capacity_building_trainings (capacity_building_training_id)
);

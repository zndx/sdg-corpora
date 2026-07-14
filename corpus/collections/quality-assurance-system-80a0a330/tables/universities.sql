CREATE TABLE universities (
  university_id INTEGER NOT NULL,
  name VARCHAR(32),
  country VARCHAR(32),
  establishment_date DATE,
  status VARCHAR(32),
  accreditation_status VARCHAR(32),
  quality_assurance_system_id INTEGER,
  national_commission_id INTEGER,
  capacity_building_training_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (university_id),
  FOREIGN KEY (quality_assurance_system_id) REFERENCES quality_assurance_systems (quality_assurance_system_id),
  FOREIGN KEY (national_commission_id) REFERENCES national_commissions (id),
  FOREIGN KEY (capacity_building_training_id) REFERENCES capacity_building_trainings (capacity_building_training_id)
);

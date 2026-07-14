CREATE TABLE animals (
  animal_id INTEGER NOT NULL,
  species VARCHAR(32),
  breed VARCHAR(32),
  weight_kg DECIMAL,
  health_status VARCHAR(32),
  microchip_id VARCHAR(44),
  animal_emergency_id INTEGER,
  animal_control_officer_id INTEGER,
  PRIMARY KEY (animal_id),
  FOREIGN KEY (animal_emergency_id) REFERENCES animal_emergencies (id),
  FOREIGN KEY (animal_control_officer_id) REFERENCES animal_control_officers (animal_control_officer_id)
);

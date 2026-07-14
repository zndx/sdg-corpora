CREATE TABLE hazardous_materials (
  id INTEGER NOT NULL,
  material_id VARCHAR(44),
  material_type VARCHAR(32),
  estimated_quantity DECIMAL,
  unit_of_measure VARCHAR(32),
  onboard_quantity DECIMAL,
  spilled_quantity DECIMAL,
  removed_quantity DECIMAL,
  vessel_id INTEGER,
  spill_incident_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (vessel_id) REFERENCES vessels (id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id)
);
